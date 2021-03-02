class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :image, :describe, :category_id, :condition_id, :shipping fee_id, :prefectures_id, :delivery time_id, :price).merge(user_id: current_user.id)
end
