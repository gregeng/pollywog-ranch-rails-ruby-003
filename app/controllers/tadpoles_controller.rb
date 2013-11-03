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
      redirect to('/tadpoles')
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
end