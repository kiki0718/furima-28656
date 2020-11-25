class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :namenull: false, default: ""
      t.references :user,             null: false, default: "", foreign_key: true, null: false, default: ""
      t.integer    :price             null: false, default: "",
      t.integer    :category_id       null: false, default: "", 
      t.integer    :status_id         null: false, default: "",
      t.integer    :delivery_fee_id   null: false, default: "",
      t.integer    :prefecture_id     null: false, default: "",
      t.integer    :ship_day_id       null: false, default: "",
      t.text       :description       null: false, default: "",
      t.timestamps
    end
  end
end
