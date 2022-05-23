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
    @animal.save

    redirect_to animals_path
  end

  def edit
  end

  def update
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
    params.require(:animal).permit(:name, :species, :description, :price)
  end

  def set_animal
    @animal = animal.find(params[:id])
  end
end
