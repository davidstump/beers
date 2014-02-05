class BeersController < ApplicationController
  def index
    render json: Beer.all.order(created_at: :desc)
  end

  def create
    @beer = Beer.new(beers_params)

    if @beer.save
      render json: "Yay"
    else
      render json: "Dammit"
    end
  end

  def destroy
    Beer.find(params[:id]).destroy
    render json: 'Destroyed'
  end

  private

  def beers_params
    params.require(:beer).permit!
  end
end
