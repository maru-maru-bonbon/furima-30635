class ItemsController < ApplicationController
  before_action :authenticate_user!,only: [:new, :edit, :destroy]
  before_action :set_item,only: [:show, :edit, :update ,:destroy]

  def index
    @items =Item.all.order("created_at DESC")
  end
  
  def show
      
  end

  def new
    @item = Item.new
  end

  def create
    @item=Item.new(item_params)
    if @item.save
      redirect_to root_path
    else 
      render :new
    end
  end

  def edit
    if current_user.id != @item.user.id || @item.purchase_detail != nil
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy || current_user.id != @item.user.id
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :shipping_area_id, :delivery_time_id, :shipping_charge_id, :selling_price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
