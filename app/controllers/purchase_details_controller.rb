class PurchaseDetailsController < ApplicationController
  before_action :authenticate_user!,only: [:index]

  def index
    @items = Item.find(params[:item_id])
    @form_object = FormObject.new
    if current_user == @items.user.id
      redirect_to root_path
    end
  end

  def create
    @items = Item.find(params[:item_id])
    @form_object = FormObject.new(purchase_details_params)
    @form_object.save
    if @form_object.valid?
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def purchase_details_params
    params.require(:form_object).permit(:postal_code,:prefecture_id,:municipality,:address,:phone_number,:building_name).merge(token: params[:token],user_id: current_user.id,item_id: params[:item_id])
  end

end
