class UsersController < ApplicationController
  def new
  end

  def index
  	  @users = User.all
      @user = current_user
      @book = Book.new
  end

  def show
      @book = Book.new
  	  @user = User.find(params[:id])
      @books = @user.books
  end

  def edit
  	  @user = User.find(params[:id])
  end

  def update
      @user = User.find(params[:id])
      if @user.update(user_params)
      redirect_to user_path(@user)
      else
      render'edit'
      end
  end

  def create
  end

private
  def user_params
      params.require(:user).permit(:profile_image, :name, :introduction)
  end
end
