class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to       :category_id
  belongs_to       :status_id
  belongs_to       :delivery_id
  belongs_to       :area_id
  belongs_to       :shopping_day_id

  has_one_attached :image
  belongs_to       :user
  # has_many         :comments
  # has_one          :history

  with_options presence: true, numericality: {other_than: 1} do
    validates :items_name
    validates :items_text
    validates :category_id
    validates :status_id
    validates :delivery_id
    validates :area_id
    validates :shopping_day_id
    validates :price
  end
end
