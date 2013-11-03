class TadpolesController < ApplicationController

  def index
    @tadpoles = Tadpole.all
  end

  def create
    tadpole = Tadpole.new
    tadpole.name = params[:name]
    tadpole.color = params[:color]
    tadpole.frog = Frog.find_by(:id => params[:frog_id].to_i)
    if tadpole.save
      redirect_to('/tadpoles')
    else
      "Error unable to save! - params: #{params.inspect} - tadpole: #{tadpole}"
    end
  end

  def show
    @tadpole = Tadpole.find(params[:id].to_i)
  end

  def edit
    @tadpole = Tadpole.find(params[:id].to_i)
  end

  def update
    tadpole = Tadpole.find(params[:id].to_i)
    tadpole.name = params[:name]
    tadpole.color = params[:color]
    tadpole.frog = params[:frog_id]
    if tadpole.save
      redirect_to('/tadpoles')
    else
      "Error unable to update! - params: #{params.inspect} - tadpole: #{tadpole}"
    end
  end

  def destroy
    tadpole = Tadpole.find(params[:id].to_i)
    if tadpole.destroy
      redirect_to('/tadpoles')
    else
      "Error unable to delete! - params: #{params.inspect} - tadpole: #{tadpole}"
    end
  end

  def evolve
    tadpole = Tadpole.find(params[:id].to_i)
    frog = Frog.new
    frog.name = tadpole.name
    frog.color = tadpole.color
    frog.pond = tadpole.frog.pond
    if frog.save && tadpole.destroy
      redirect_to('/frogs')
    else
      "Error unable to evolve! - params: #{params.inspect} - tadpole: #{tadpole} - frog: #{frog}"
    end
  end

end