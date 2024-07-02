class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.book
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to user_path(current_user.id)
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def index
    @user = User.find(current_user.id)
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
end
