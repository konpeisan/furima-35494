class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string      :postal_code,      null: false
      t.string      :municipality,     null: false
      t.string      :address,          null: false
      t.string      :building
      t.string      :phone,            null: false
      
      t.timestamps
    end
  end
end
