class PagesController < ApplicationController
  def index
  end

  def beers
    render json: Beer.all
  end
end
