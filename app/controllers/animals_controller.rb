class AnimalsController < ApplicationController
  before_action :set_animal, only: %I[show edit update dead]
  def index
    if params["search"].nil?
      @animals = Animal.all
    else
      search = params["search"]["query"]
      @animals = Animal.select { |animal| animal.city.strip.downcase == search.downcase.strip }
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

    if @animal.save
      redirect_to animals_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @animal.update(animal_params)
      redirect_to @animal, notice: "#{@animal.name} was successfully updated."
    else
      render :edit
    end
  end

  def dead
    @animal.dead = true
    @animal.save
    redirect_to animal_path(@animal)
  end


  private

  def animal_params
    params.require(:animal).permit(:name, :age, :city, :price, :photo, :description, :breed, :colour)
  end

  def set_animal
    @animal = Animal.find(params[:id])
  end
end
