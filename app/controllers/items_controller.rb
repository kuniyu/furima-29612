class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new]
  before_action :set_item, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show,]

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

  def show
  end

  def edit
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
       redirect_to  item_path
    else
      render :show
    end
    
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :image, :describe, :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :deliverytime_id, :price).merge(user_id: current_user.id)
  
  end
  
  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    if user_signed_in? && current_user.id == @item.user_id
      
      
    elsif user_signed_in? && current_user.id != @item.user_id
      redirect_to root_path

    else
      redirect_to new_user_session_path
    end
  end
end