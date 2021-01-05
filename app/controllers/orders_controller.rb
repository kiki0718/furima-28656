class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :item_get, only: [:index, :create]
  def index
    @purchase = Purchase.new
    @orders = Order.select('item_id')
    return redirect_to root_path if current_user.id == @item.user.id
    @orders.each do |order|
      if @item.id == order.item_id
        return redirect_to root_path
      end
    end
  end

  def create
    @purchase = Purchase.new(order_params)
      if @purchase.valid?
        pay_item
        @purchase.save
        redirect_to root_path
      else
        render :index
      end
  end

  private

  def order_params
    params.require(:purchase).permit(:postal_code, :prefecture_id, :municipatities, :building_name, :house_number, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token], price: params[:item_price])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
    amount: @item.price,
    card: order_params[:token],
    currency: 'jpy'
    )
  end

  def item_get
    @item = Item.find(params[:item_id])
  end

end
