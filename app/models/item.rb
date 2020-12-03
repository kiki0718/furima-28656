class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :selector
  belongs_to :user
  has_one_attached :image
  
  validates :image, :name, :description, presence: true
  validates :name, length: { maximum: 40 }
  validates :description, length: { maximum: 1000 }
  validates :category_id, :status_id, :delivery_fee_id, :prefecture_id, :ship_day_id, numericality: { other_than: 1 }
  validates :price, presence: true
  validates :price, numericality: { message: '半角数字で入力してださい。' }, inclusion: { in: 300..9999999, message: '価格は300円〜9999999円の範囲で入力してください。' }, allow_blank: true
end
