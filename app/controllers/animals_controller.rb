class AnimalsController < ApplicationController
  before_action :set_animal, only: %i[show edit update destroy]

  def index
    if params[:query].present?
      sql_query = "species ILIKE :query OR name ILIKE :query"
      @animals = Animal.where(sql_query, query: "%#{params[:query]}%")
    else
      @animals = Animal.all
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
      redirect_to animal_path(@animal)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @animal = Animal.find(params[:id])
    @animal.update(animal_params)

    redirect_to animals_path
  end

  def destroy
    @animal = Animal.find(params[:id])
    @animal.destroy

    redirect_to animals_path
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :species, :description, :price, :photo)
  end

  def set_animal
    @animal = Animal.find(params[:id])
  end
end
