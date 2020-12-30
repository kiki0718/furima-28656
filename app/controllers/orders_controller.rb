class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @purchase = Purchase.new
    @item = Item.find(params[:item_id])
    return redirect_to root_path if current_user.id == @item.user.id
  end

  def create
    
    @item = Item.find(params[:item_id])
    @purchase = Purchase.new(order_params)
      if @purchase.valid?
        @purchase.save
        redirect_to root_path
      else
        render :index
      end
  end

  private
  def order_params
    params.require(:purchase).permit(:postal_code, :prefecture_id, :municipatities, :building_name, :house_number, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
