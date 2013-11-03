class FrogsController < ApplicationController

  def index
    @frogs = Frog.all

  end

  def show
    @frog = Frog.find(params[:id].to_i)
  end

  def edit
    @frog = Frog.find(params[:id].to_i)
    @ponds = Pond.all
  end

  def create
    frog = Frog.new
    frog.name = params[:name]
    frog.color = params[:color]
    frog.pond = Pond.find_by(:id => params[:pond_id].to_i)
    if frog.save
      redirect_to('/frogs')
    else
      "Error unable to save! - params: #{params.inspect} - frog: #{frog}"
    end
  end

  def update
    frog = Frog.find(params[:id].to_i)
    frog.name = params[:name]
    frog.color = params[:color]
    frog.pond = Pond.find_by(:id => params[:pond_id].to_i)
    if frog.save
      redirect_to('/frogs')
    else
      "Error unable to update! - params: #{params.inspect} - frog: #{frog}"
    end
  end

  def destroy
    frog = Frog.find(params[:id].to_i)
    if frog.destroy
      redirect_to('/frogs')
    else
      "Error unable to delete! - params: #{params.inspect} - frog: #{frog}"
    end
  end

  def create_tadpole
    @frog = Frog.find_by(:id => params[:id].to_i)
    render 'tadpoles/new'
  end

  def new
    @ponds = Pond.all
  end

end