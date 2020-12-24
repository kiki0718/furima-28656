class Purchase
  include ActibeModel::Model
  attr_accessor :user, :item, :purchse_record_id, :postal_code, :prefecture_id, :municipatities, :building_name, :house_number, :phone_number

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipatities
    validates :house_number
    validates :phone_number, format: {with: /\A\d{11}\z/}
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  
end