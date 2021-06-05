class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create,:edit,:update]
  before_action :item_find, only: [:show,:edit,:update,:destroy]
  before_action :go_root, only: [:edit,:update,:destroy]
  before_action :out_root, only: [:edit,:update,:destory]
  impressionist actions: [:show]

  def index
    @items = Item.includes(:user).order("created_at DESC")
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

  def show
    @item = Item.find(params[:id])
    impressionist(@item,nil,unique: [:ip_address])
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:image,:items_name,:items_text,:category_id,:status_id,:delivery_id,:area_id,:shopping_day_id,:price).merge(user_id: current_user.id)
  end

  def item_find
    @item = Item.find(params[:id])
  end

  def go_root
    redirect_to root_path unless current_user.id == @item.user.id
  end

  def out_root
    redirect_to root_path if @item.history.present?
  end
end
