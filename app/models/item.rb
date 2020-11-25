class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  bolongs_to :selector
  belongs_to :user
  has_one_attached :image
  
  validates :name, :category_id, :status_id, :delivery_fee,
            :prefecture_id, :ship_day_id, :description, :image, presence: true
  validates :price format: { with: /\A[-]?[0-9]+(\.[0-9]+)?\z/ }, inclusion: {in: 300..9999999}, presence: true
end
