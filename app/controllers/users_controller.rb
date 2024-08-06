class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    @user = current_user.id
    @user.save
    redirect_to users_path(current_user.id)
  end
  
  def index
    @users = User.all
    @book.user_id = current_user
  end

  def show
  
   @user = User.find(params[:id])
   @books = @user.books
   


  end
  def edit
    @user = User.find(params[:id])
  end

  

  private
  def user_params
    params.require(:user).permit(:title, :body, :image)
  end
end