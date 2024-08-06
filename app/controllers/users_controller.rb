class UsersController < ApplicationController


  def index
    @users = User.all
    @book.user_id = current_user.id

  end

  def create
    @user = User.new(user_params)
    @user = current_user.id
    if @user.save
      flash[:notice] = " successfully."
      redirect_to users_path(current_user.id)
    else
      flash[:notice] =  "error"
     render :index
    end
  end

  def show

   @user = User.find(params[:id])
   @books = @user.books
  end


  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = " You have updated user successfully."
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
