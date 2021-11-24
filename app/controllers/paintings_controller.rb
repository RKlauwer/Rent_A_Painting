class PaintingsController < ApplicationController
  def new
    @painting = Painting.new
  end

  def show
    @painting = Painting.find(params[:id])
  end

  def create
    @painting = Painting.new(painting_params)
    @painting.user = current_user
    if @painting.save
      redirect_to paintings_path
    else
      render :new
    end
  end

  def index
    @paintings = Painting.all
  end


  private

  def painting_params
    params.require(:painting).permit(:author, :size, :price, :photo)
  end
end
