class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to       :category
  belongs_to       :status
  belongs_to       :delivery
  belongs_to       :area
  belongs_to       :shopping_day

  has_one_attached :image
  belongs_to       :user
  # has_many         :comments
  # has_one          :history

  with_options presence: true do
    validates :image
    validates :items_name
    validates :items_text

    with_options numericality: {other_than: 1} do
      validates :category_id
      validates :status_id
      validates :delivery_id
      validates :area_id
      validates :shopping_day_id
    end
    
    with_options format: {with: /\A[0-9]+\z/} do
      validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message:"は300~9,999,999の間で指定してください"}
    end
  end
end
