class Purchase
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipatities, :building_name, :house_number, :phone_number

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipatities
    validates :house_number
    validates :phone_number, format: {with: /\A\d{10,11}\z/}
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(order_id: order.id, postal_code: postal_code, prefecture_id: prefecture_id, municipatities: municipatities, building_name: building_name, house_number: house_number, phone_number: phone_number)
  end
end