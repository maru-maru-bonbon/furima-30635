class PurchaseDetailsController < ApplicationController

  def index
    @items = Item.find(params[:item_id])
    @form_object = FormObject.new
  end

  def create
    @form_object = FormObject.new(purchase_details_params)
    if @form_object.valid?
      @form_object.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def purchase_details_params
    params.require(:form_object).permit(:postal_code,:prefecture_id,:municipality,:address,:phone_number).merge(token: params[:token],user_id: current_user.id,item_id: params[:item_id])
  end
end
