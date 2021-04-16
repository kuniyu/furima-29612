class PurchasesController < ApplicationController
  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render 'index'
    end
  end

  private

  def order_params
    params.permit(:postal_code, :prefecture_id, :municipal, :block_number, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
end
