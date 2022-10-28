class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :destroy, :update]
  before_action :check_login, only: [:edit, :destroy]


  def index
    @items = Item.order("created_at DESC")
  end

  def new 
    @item = Item.new
  end

  def create 
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    if @item.purchase.present?
      redirect_to root_path
    end

  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
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
    params.require(:item).permit(:product_name, :description, :category_id, :condition_id, :price, :delivery_charge_id, :prefecture_id, :delivery_period_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def check_login
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
  end

end
