class UsersController < ApplicationController
  def index
   @book = Book.new
   @book.user_id = current_user.id
   @users = User.all
   
  end

  def show
   @book = Book.new
   @book.user_id = current_user.id
   @user = User.find(params[:id])
   @books = @user.books
   
  end

  def edit
    
    user = User.find(params[:id])
     unless user.id == current_user.id
      redirect_to users_path(user.id)
     end
   @user = User.find(params[:id])

  end

   def create
    @user = User.new(user_params)
    @user = current_user.id
    if @user.save
     flash[:notice] = "Welcome! You have signed up successfully."
     redirect_to users_path(current_user.id)
    else
      flash[:notice] =  "error"
      render :new
    end
   end

   def update
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to books_path
    end

    @user = User.find(params[:id])
    if @user.update(user_params)
     flash[:notice] = "You have updated user successfully."
     redirect_to user_path(@user.id)
    else
      flash[:notice] =  "error"
      render :edit
    end
   end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end
end
