class DosesController < ApplicationController

  def index
    @cocktail = Cocktail.find(params[:cocktail_id])
    @doses = @cocktail.doses.all
  end

  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredient = Ingredient.find(params[:dose][:ingredient_id])
    @dose = Dose.new(description: params[:dose][:description], cocktail_id: @cocktail.id, ingredient_id: @ingredient.id)
    if @dose.save
      redirect_to cocktails_path
    else
      render 'new'
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktails_path
  end
end
