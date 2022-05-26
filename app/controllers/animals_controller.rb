class AnimalsController < ApplicationController
  before_action :set_animal, only: %i[show edit update destroy]

  def index
    @animals = Animal.all
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
    @animal.update(animal_params)

    redirect_to dashboard_path, notice: "You're mini crotte has been updated succefully "
  end

  def destroy
    @animal.destroy

    redirect_to dashboard_path, notice: "You're mini crotte has been destroyed succefully "
  end

  private

  def animal_params
    params.permit(:name, :species, :description, :price, :photo)
  end

  def set_animal
    @animal = Animal.find(params[:id])
  end
end
