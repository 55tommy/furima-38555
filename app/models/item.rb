class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :delivery_period
  belongs_to :prefecture

  belongs_to :user
  has_one_attached :image


  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }, presence: true
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }, presence: true
  validates :delivery_charge_id, numericality: { other_than: 1, message: "can't be blank" }, presence: true
  validates :delivery_period_id, numericality: { other_than: 1, message: "can't be blank" }, presence: true
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }, presence: true
  
  validates :product_name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than:299, less_than:10000000 }
  validates :image, presence: true



end
