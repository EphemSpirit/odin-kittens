class KittensController < ApplicationController
  before_action :find_kitten, only: [:show, :edit, :destroy, :update]

  def index
    @kittens = Kitten.all

    respond_to do |format|
      format.html
      format.json { render json: @kittens }
    end
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)

    if @kitten.save
      flash[:success] = "You've created a new fur-baby!"
      redirect_to @kitten
    else
      flash[:error] = "You've angered the gods with your pitiful attempt at Catomancy"
      render :new
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @kitten }
    end
  end

  def edit
  end

  def update
    @kitten.update(kitten_params)

    if @kitten.save
      flash[:success] = "Kitten updated!"
      redirect_to @kitten
    else
      flash[:error] = "Update failed!"
      render :new
    end
  end

  def destroy
    @kitten.destroy
    flash[:success] = "The kitty lives no longer..."
    redirect_to root_url
  end

  private

    def find_kitten
      @kitten = Kitten.find(params[:id])
    end

    def kitten_params
      params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end

end
