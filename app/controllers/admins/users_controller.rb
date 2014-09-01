class Admins::UsersController < ApplicationController
  authorize_resource

  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "Usuario creado."
    else
      flash.now.alert = "Hubo un problema al crear el Usuario: #{@user.email}."
      render :new
    end
  end
  
  protected
  
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
