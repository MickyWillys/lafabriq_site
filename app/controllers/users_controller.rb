class UsersController < ApplicationController
  def show
  	@user= User.find(params[:id])
  end
  
  def new
  	@user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Bienvenu dans le Réseau Solidaire de Compétences de La Fabriq!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:prenom, :nom, :email, :password,
                                   :password_confirmation)
    end
end
