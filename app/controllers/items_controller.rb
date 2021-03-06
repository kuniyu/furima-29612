class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to  root_path
    else
      render :new
    end  
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :image, :describe, :category_id, :condition_id, :shipping_fee_id, :prefectures_id, :delivery_time_id, :price).merge(user_id: current_user.id)
  
  end
end