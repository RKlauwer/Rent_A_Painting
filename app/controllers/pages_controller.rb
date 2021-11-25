class PagesController < ApplicationController
  def home
    if params[:range].present?
      @range = params[:range].to_i
      @paintings = Painting.where("price < ?", @range)
    else
      @range = 100
      @paintings = Painting.all
    end
  end

  def profile
  end
end
