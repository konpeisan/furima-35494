class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string             :items_name,       null: false
      t.text               :items_text,       null: false
      t.integer            :category_id,      null: false
      t.integer            :status_id,        null: false
      t.integer            :delivery_id,      null: false
      t.integer            :area_id,          null: false
      t.integer            :shopping_day_id,  null: false
      t.integer            :price,            null: false
      t.references         :user,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
