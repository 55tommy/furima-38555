class Address < ApplicationRecord
  belongs_to :purchase

  #validatesは不要
end
