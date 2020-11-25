class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  bolongs_to :selector
  belongs_to :user
  has_one_attached :image
end
