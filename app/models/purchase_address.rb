class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :purchase_id
  
  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :house_number
    validates :phone_number, format: {with: /\d{10,11}/ }
    validates :user_id
    validates :item_id

  end

  def save
    #各情報をカラムへ保存して、変数に代入する
    purchase = Purchase.create(user_id: user_id, item_id: item_id )
    address = Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number, phone_number: phone_number, purchase_id: purchase_id, building_name: building_name)
  end
end



