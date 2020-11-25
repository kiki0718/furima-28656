class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.integer :price
      t.integer :category_id 
      t.integer :status_id
      t.integer :delivery_fee_id
      t.integer :prefecture_id
      t.integer :ship_day_id
      t.text :description
      t.timestamps
    end
  end
end
