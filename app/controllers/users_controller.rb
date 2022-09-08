
class UsersController < ApplicationController 
  before_action :require_user, only: [:show]

  def show 
    @user = User.find(params[:id])
  end

  def new 
    @user = User.new
  end

    def create
    new_user = User.new(user_params)
    if new_user.save
      session[:user_id] = new_user.id
      redirect_to user_path(new_user)
      flash[:success] = "Welcome, #{new_user.name}!"
    else #new_user == nil
      redirect_to register_path
      flash[:error] = new_user.errors.full_messages
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
