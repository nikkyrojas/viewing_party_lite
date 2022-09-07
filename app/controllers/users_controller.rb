
class UsersController < ApplicationController 

  def show 
    @user = User.find(params[:id])
  end

  def new 
    @user = User.new
  end

  def create
    new_user = User.create!(user_params) 
    binding.pry
    if new_user.save
      redirect_to user_path(new_user)
      flash[:success] = "Your Account has been Created, #{new_user.name}!"
    else new_user == nil
      redirect_to register_path
      flash[:error] = "Missing Fields"
    end
    binding.pry
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
