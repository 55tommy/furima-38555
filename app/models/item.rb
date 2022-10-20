class Item < ApplicationRecord
  belongs_to :user


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  belongs_to :condition
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }  
  belongs_to :delivery_charge
  validates :delivery_charge_id, numericality: { other_than: 1, message: "can't be blank" }
  belongs_to :delivery_period
  validates :delivery_period_id, numericality: { other_than: 1, message: "can't be blank" }

  #validates :title, :text, presence: true

end
