class Purchase
  include ActibeModel::Model
  attr_accessor :user, :item, :purchse_record_id, :postal_code, :prefecture_id, :municipatities, :building_name, :house_number, :phone_number
end