class PurchasesController < ApplicationController

  def index
    @purchase_address = PurchaseAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid? 
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end
end

private

def purchase_params
  params.require(:purchase_address).permit(:post_code, :prefecture_id, :city, :house_number, :phone_number, :building_name, :purchase_id).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
end

def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  Payjp::Charge.create(
    amount: @item.price,
    card: purchase_params[:token],
    currency: 'jpy'
  )
end