class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :purchase_id, :token
  
  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "に誤りがあります。ハイフンがあるか確認して下さい。"}
    validates :prefecture_id, numericality: { other_than: 1, message: "を選択して下さい" }
    validates :city
    validates :house_number
    validates :phone_number, format: {with: /\A\d{10,11}\z/ }
    validates :user_id
    validates :item_id
    validates :token

  end

  def save
    #各情報をカラムへ保存して、変数に代入する
    purchase = Purchase.create(user_id: user_id, item_id: item_id )
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number, phone_number: phone_number, purchase_id: purchase.id, building_name: building_name)
  end
end



