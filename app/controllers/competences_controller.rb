class CompetencesController < ApplicationController
  before_action :signed_in_user
  
  def create
    @competence = current_user.competences.build(competences_params)
    if @competence.save
      flash[:success] = "Competences sauvegardées!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def edit
    @user = current_user
    @competence = @user.competences.find(params[:id])
  end

  def update
    @user = current_user
    @competence = @user.competences.find(params[:id])
    # binding.pry
    if @competence.update_attributes(competences_params)
      flash[:success] = "Compétence mise à jour"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
  end

  def index
    @user = current_user
  end

  def show
    # binding.pry
    @user = current_user
    @competence = @user.competences.find(params[:id])
  end

  private

    def competences_params
      params.require(:competence).permit(:titre, :descriptif, :experience)
    end
end