class PondsController < ApplicationController

  def index
    @ponds = Pond.all
  end

  def show
    @pond = Pond.find(params[:id].to_i)
  end

  def edit
    @pond = Pond.find(params[:id].to_i)
  end

  def create
    pond = Pond.new
    pond.name = params[:name]
    pond.water_type = params[:water_type]
    if pond.save
      redirect_to('/ponds')
    else
      render text: "Error unable to save! - params: #{params.inspect} - pond: #{pond}"
    end
  end

  def update
    pond = Pond.find(params[:id].to_i)
    pond.name = params[:name]
    pond.water_type = params[:water_type]
    if pond.save
      redirect_to('/ponds')
    else
      render text: "Error unable to update! - params: #{params.inspect} - pond: #{pond}"
    end
  end

  def destroy
    pond = Pond.find(params[:id].to_i)
    if pond.destroy
      redirect_to('/ponds')
    else
      "Error unable to delete! - params: #{params.inspect} - pond: #{pond}"
    end
  end

end
