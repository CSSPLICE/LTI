class UsersController < ApplicationController
  before_action :save_login_state, :only => [:new, :create]
  def new
    @user = User.new
  end
  def create
    @user = User.new(allowed_params)
    if @user.save
      flash[:notice] = "You signed up successfully"
      flash[:color]= "valid"
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
    end
    render "new"
  end
  def allowed_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
