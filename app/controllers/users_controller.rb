class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to user_path(current_user)
    end
  end

  def index
    @user = current_user
    @book = Book.new
    @users = User.where.not(id: current_user.id)
    @books = Book.all
  end

  def followeds
    user = User.find(params[:id])
    @users = user.followeds
    @followings = user.followeds
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
    @followers = user.followers
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
      flash[:notice] = "Book was successfully created."
    else
      @books = Book.all
      render :index
    end
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
    # @book = Book.find(params[:id])

  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end