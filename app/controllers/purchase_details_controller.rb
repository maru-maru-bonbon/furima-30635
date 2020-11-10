class PurchaseDetailsController < ApplicationController
  before_action :authenticate_user!,only: [:index]
  before_action :set_item,only: [:index,:create,:pay_item]

  def index
    @form_object = FormObject.new
    if current_user.id == @items.user.id || @items.purchase_detail != nil
      redirect_to root_path
    end
  end

  def create
    @form_object = FormObject.new(purchase_details_params)
    if @form_object.valid?
      pay_item
      @form_object.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def purchase_details_params
    params.permit(:postal_code,:prefecture_id,:municipality,:address,:phone_number,:building_name).merge(token: params[:token],user_id: current_user.id,item_id: params[:item_id])
  end

  def set_item
    @items = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @items.selling_price,
      card: purchase_details_params[:token],    
      currency: 'jpy' 
    )                
  end

 
end