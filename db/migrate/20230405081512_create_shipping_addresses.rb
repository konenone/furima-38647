class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.references :purchase_record,         null: false, foreign_key: true
      t.string     :post_code,      null: false
      t.integer    :shipping_area_id, null: false
      t.string     :municipalities,          null: false
      t.string     :address,         null: false
      t.string     :building_name
      t.string     :phone_number,  null: false
      t.timestamps
    end
  end
end
