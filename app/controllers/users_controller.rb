
class UsersController < ApplicationController 

  def show 
    @user = User.find(params[:id])
  end

  def new 
    @user = User.new
  end

  def create
    new_user = User.create(user_params) if User.find_by_email(user_params[:email]) == nil
    if new_user.save
      redirect_to user_path(new_user)
    else
      redirect_to register_path
    end
  end
  
  def discover
    @user = User.find(params[:id])
  end

  private 
  def user_params
 
    params.permit(:name, :email, :password, :password_confirmation) 
    # params.require(:user).permit(:name, :email, :password, :password_confirmation) 
  end
end
