class PagesController < ApplicationController
  def home
    @paintings = Painting.all
  end

  def profile
  end
end
