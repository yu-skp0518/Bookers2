class BooksController < ApplicationController

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

  def index
    @book = Book.new
    @books = Book.all
  end


  def edit
    @book = Book.find(params[:id])
    @user = @book.user
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to books_path(@book.id)
  end

  def show
    @newbook = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

before_action :authenticate_user!

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
    flash[:notice] = "Book was successfully destroyed"
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end