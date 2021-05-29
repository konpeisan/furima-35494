class Order < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to       :area
 # attr_accessor :token

 # with_options presence: true do
  #  validates :postal_code, format:{with: /\A[0-9]{3}-[0-9]{4}\z/, message:"は(-)を含めてください"}
  #  validates :municipality, format:{with: /\A[ぁ-んァ-ンー-龥]/, message:""}
  #  validates :address
  #  validates :phone, format:{with: /\A\d{10}\z|\A\d{11}\z/, message:""}
  #  validates :token
 # end
  belongs_to :history
end
