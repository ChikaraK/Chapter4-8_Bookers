class BookersController < ApplicationController
  def top
  end

  def index
  	#一覧表示用
  	@bookers = Booker.all
  	# form-for用
  	@booker = Booker.new
  end
  def create
  	@booker = Booker.new(booker_params)
  	if @booker.save
      flash[:notice] = "Book was successfully created"
      redirect_to booker_path(@booker)
    else
      render action: :top
    end
  end
  def show
  	@booker = Booker.find(params[:id])
  end

  def edit
  	@booker = Booker.find(params[:id])
  end
  def update
  	@booker = Booker.find(params[:id])
    if @booker.update(booker_params)
      flash[:notice] = "Book was succesfully updated"
  	  redirect_to booker_path(@booker)
    else
      render action:top
    end
  end
  def destroy
    @booker = Booker.find(params[:id])
  	if @booker.destroy
      flash[:notice] = "Book was succesfully deleted"
  	  redirect_to bookers_path
    else
      render action:top
    end
  end


  private

  def booker_params
  	params.require(:booker).permit(:title, :body)
  end
end
