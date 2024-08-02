class UsersController < ApplicationController
  def show
   
  end

  def edit
  end
  
  def create
    @user = User.new(user_params)
    @user = current_user.id
    @user.save
    redirect_to users_path(current_user.id)
  end
  
  private
  def user_params
    params.require(:user).permit(:title, :body, :image)
  end
end
