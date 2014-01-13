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

  def destroy
  end

  private

    def competences_params
      params.require(:competence).permit(:titre, :descriptif, :experience)
    end
end