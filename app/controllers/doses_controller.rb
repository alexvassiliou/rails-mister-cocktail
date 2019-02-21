class DosesController < ApplicationController
  before_action :set_dose, only: [:show, :edit, :update, :destroy]

  def new
    @dose = Dose.new
  end

  def create
    @dose = dose.new(dose_params)
    @dose.Ingredient = @ingredient
    @dose.save
    redirect_to cocktail_path(@cocktail)
  end

  private

  # def dose_params
  #   params.require(:dose).permit(:content)
  # end

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:ingredient)
  end
end
