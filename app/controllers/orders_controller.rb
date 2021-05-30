class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index,:create]
  before_action :item_params, only: [:index,:create]
  before_action :to_root, only: [:index,:create]
  before_action :sold_root, only: [:index,:create]

  def index
    @history_order = HistoryOrder.new
  end

  def create
    @history_order = HistoryOrder.new(order_params)
    if @history_order.valid?
      pay_item
      @history_order.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:history_order).permit(:postal_code,:area_id,:municipality,:address,:building,:phone).merge(token: params[:token],user_id: current_user.id,item_id: @item.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def item_params
    @item = Item.find(params[:item_id])
  end

  def to_root
    redirect_to root_path if current_user == @item.user
  end

  def sold_root
    redirect_to root_path if @item.history.present?
  end
end
