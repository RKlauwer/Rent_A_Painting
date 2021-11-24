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
    if params[:query].present?
      @query = params[:query]
      sql_query = "author ILIKE :query OR size ILIKE :query"
      @paintings = Painting.where(sql_query, query: "%#{params[:query]}%")
    else
      @paintings = Painting.all
    end
  end


  private

  def painting_params
    params.require(:painting).permit(:author, :size, :price, :photo)
  end
end
