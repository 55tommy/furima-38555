class Purchase < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one :address

  #validatesは不要
end
