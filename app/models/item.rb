class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  bolongs_to :selector
  belongs_to :user
  has_one_attached :image
  
  validates :name, :price, :category_id, :status_id, :delivery_fee,
            :prefecture_id, :ship_day_id, :description,
end
