class BreweriesController < ApplicationController
  def index
    render json: Brewery.all
  end
end
