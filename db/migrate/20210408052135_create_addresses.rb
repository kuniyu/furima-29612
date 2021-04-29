class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string   :postal_code,         null: false
      t.integer  :prefecture_id,       null: false
      t.string   :municipal,           null: false
      t.string   :block_number,        null: false
      t.string   :building_number   
      t.string   :phone_number,        null: false
      t.integer  :purchase_id,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
