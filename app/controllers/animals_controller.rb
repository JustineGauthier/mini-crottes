class AnimalsController < ApplicationController
  before_action :set_animal, only: %i[show edit update destroy]

  def index
    @animals = Animal.geocoded

    if params[:query].present?
      sql_query = "species ILIKE :query OR name ILIKE :query"
      @animals = Animal.where(sql_query, query: "%#{params[:query]}%")
    else
      @animals = Animal.all
    end

    @markers = @animals.map do |animal|
      {
        lat: animal.latitude,
        lng: animal.longitude,
        info_window: render_to_string(partial: "info_window", locals: { animal: animal })
        # image_url: helpers.asset_url("REPLACE_THIS_WITH_YOUR_IMAGE_IN_ASSETS")
      }
    end
  end

  def show
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)
    @animal.user = current_user
    if @animal.save!
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @animal.update(animal_params)

    redirect_to dashboard_path, notice: "You're mini crotte has been updated succefully "
  end

  def destroy
    @animal.destroy

    redirect_to dashboard_path, notice: "You're mini crotte has been destroyed succefully "
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :species, :description, :price, :photo, :address)
  end

  def set_animal
    @animal = Animal.find(params[:id])
  end
end
