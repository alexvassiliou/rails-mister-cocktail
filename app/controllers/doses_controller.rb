class DosesController < ApplicationController
  before_action :set_cocktail, except: :destroy


  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit
    @dose = Dose.find(params[:id])
  end


  def destroy
    @dose = Dose.find(params[:id])
    if @dose.destroy
      flash[:notice] = "successfully deleted"
      redirect_to cocktail_path(@dose.cocktail)
    else
      flash[:error] = "there was an error deleting the dose"
      render :show
    end
  end

  private


  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
