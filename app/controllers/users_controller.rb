class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end


  def index
    @user = current_user
    @book = Book.new
    @users = User.all
    @books = Book.all
  end

  def update
    @user = User.find(params[:id])
      if @user.update(user_params)
      redirect_to user_path(@user.id)
      flash[:notice] = "User info was successfully updated"
    else
      render "edit"
    end
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.where(user_id: @user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :caption)
  end
end