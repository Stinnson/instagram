class PicturesController < ApplicationController
  before_action :find_pic, only: [:show, :edit, :update, :destroy]

  def index
    @pics = Picture.all.order("created_at DESC")
  end

  def show
  end

  def new
    @pic = Picture.new
  end

  def create
    @pic = Picture.new(pic_params)
    if @pic.save
      flash[:success] = "Yaye! Your picture is posted!"
      redirect_to @pic
    else
      render "new"
    end
  end

  def edit

  end

  def update
    if @pic.update(pic_params)
      flash[:success] = "Your picture was updated"
      redirect_to @pic
    else
      render "edit"
    end
  end

  def destroy
    @pic.destroy
    redirect_to root_path
  end

  private

  def pic_params
    params.require(:picture).permit(:title, :description)
  end

  def find_pic
    @pic = Picture.find(params[:id])
  end

end
