class Order < ApplicationRecord
  attr_accessor :token

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area

  with_options presence: true do
    validates :postal_code
    validates :municipality
    validates :address
    validates :phone
    validates :token

    with_options numericality: {other_than: 1} do
      validates :area_id
    end
  end
  validates :building
end
