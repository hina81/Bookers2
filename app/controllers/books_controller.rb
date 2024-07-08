class BooksController < ApplicationController

  before_action :is_matching_login_user, only: [:edit]

  def index
    @user = User.find(current_user.id)
    @book_n = Book.new
    @books = Book.all
  end

  def create
    @books = Book.all
    @user = User.find(current_user.id)
    @book_n = Book.new(book_params)
    @book_n.user_id = current_user.id
    if @book_n.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book_n.id)
    else
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
    @user = User.find(current_user.id)
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def show
    @book_n = Book.new
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def is_matching_login_user
    book = Book.find(params[:id])
    unless book.user_id == current_user.id
      redirect_to books_path
    end
  end
  
end
