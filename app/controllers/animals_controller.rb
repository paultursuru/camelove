class AnimalsController < ApplicationController
  def index
    @animals = Animal.all
  end

  def show
    @animal = Animal.find(animal_params)
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)
    @animal.user = current_user

    if @animal.save
      redirect_to animals_path
    else
      render :new
    end
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :age, :city, :price, :photo, :description, :breed, :colour)
  end
end
