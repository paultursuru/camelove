class AnimalsController < ApplicationController
  before_action :set_animal, only: %I[show edit update dead]
  def index
    if params["search"]["query"].blank?
      @animals = policy_scope(Animal).order(created_at: :desc)
    else
      search = params["search"]["query"]
      @animals = policy_scope(Animal).near(search, 10)
    end

    @markers = @animals.map do |animal|
      {
       lat: animal.latitude,
       lng: animal.longitude,
       infoWindow: render_to_string(partial: "info_window", locals: { animal: animal }),
       image_url: helpers.asset_url('https://mpng.pngfly.com/20180714/tvc/kisspng-llama-clip-art-llama-llama-5b49a4f52f0ab9.5142269715315530131927.jpg')
      }
    end
  end

  def show
    authorize @animal
  end

  def new
    @animal = Animal.new
    authorize @animal
  end

  def create
    @animal = Animal.new(animal_params)
    authorize @animal

    @animal.user = current_user

    if @animal.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
    authorize @animal
  end

  def update
    if @animal.update(animal_params)
      redirect_to @animal, notice: "#{@animal.name} was successfully updated."
    else
      render :edit
    end
    authorize @animal
  end

  def dead
    @animal.dead = true
    @animal.save
    redirect_to dashboard_path(@animal)
  end


  private

  def animal_params
    params.require(:animal).permit(:name, :age, :address, :price, :photo, :description, :breed, :colour)
  end

  def set_animal
    @animal = Animal.find(params[:id])
  end
end
