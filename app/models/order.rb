class Order < ApplicationRecord
  belongs_to :selector, optional:true
  belongs_to :prefecture, optional:true
  belongs_to :user
  belongs_to :item
  has_one :adress
end
