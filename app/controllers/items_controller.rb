class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def new 
    @item = Item.new
  end

  def create 
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end

  end

  private
  def item_params
    params.require(:item).permit(:product_name, :description, :category_id, :condition_id, :price, :delivery_charge_id, :prefecture_id, :delivery_period_id, :image).merge(user_id: current_user.id)
  end
end
