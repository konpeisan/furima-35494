class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create]

  def index
   # @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render new_item_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:image,:items_name,:items_text,:category_id,:status_id,:delivery_id,:area_id,:shopping_day_id,:price).merge(user_id: current_user.id)
  end
end
