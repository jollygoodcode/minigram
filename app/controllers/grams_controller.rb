class GramsController < ApplicationController
  def index
    @grams =
      if current_user
        current_user.grams.page(params[:page]).per(5)
      else
        Gram.page(params[:page]).per(5)
      end
  end

  def new
    @gram = Gram.new
  end

  def create
    @gram = Gram.new(params.require(:gram).permit(:title, :content, :country_code, :image_url))
    @gram.user = current_user

    if @gram.save
      redirect_to @gram, notice: 'You have successfully grammed!'
    else
      render :new
    end
  end

  def show
    @gram = Gram.find(params[:id])
  end

  def destroy
    @gram = Gram.find(params[:id])
    @gram.destroy

    redirect_to grams_path
  end
end
