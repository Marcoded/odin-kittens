class KittensController < ApplicationController
  def index
    @kittens = Kitten.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @kittens }
    end

  end

  def show
    @kitten = Kitten.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @kitten }
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy
    flash[:notice] = "Kitten deleted."
    redirect_to kittens_path
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])

    if @kitten.update(kitten_params)
      flash[:notice] = "Kitten was successfully updated."
      redirect_to kitten_path(@kitten)
    else
      flash[:error] = "There was a problem updating the kitten."
      render :edit
    end
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      redirect_to @kitten, notice: 'Kitten was successfully created.'
    else
      flash[:error] = "There was a problem creating the kitten."
    end
  end

  


  private

  def kitten_params
    params.require(:kitten).permit(:name, :age,:cuteness,:softness)
  end



end
