class AnimalsController < ApplicationController
  def index
    @animals = Animal.all
    
  def show
    @animal = Animal.find(animal_params)
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :age, :city, :price, :photo, :description, :breed, :colour)
  end
end
