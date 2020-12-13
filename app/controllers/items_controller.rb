class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :login_check, only: [:destroy]
  before_action :item_get, only: [:show, :destroy]

  def new
    @item = Item.new
  end
  
  def show
  end

  def index
    @items = Item.all.order('created_at DESC')
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :category_id, :status_id, :delivery_fee_id, :prefecture_id, :ship_day_id, :description, :image).merge(user_id: current_user.id)
  end

  def login_check
    unless user_signed_in?
      redirect_to root_path
    end
  end

  def item_get
    @item = Item.find(params[:id])
  end
end
