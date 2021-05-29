class HistoryOrder
  include ActiveModel::Model
  attr_accessor :postal_code,:area_id,:municipality,:address,:building,:phone,:item_id,:user_id,:history_id,:token

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :municipality, format:{with: /\A[ぁ-んァ-ンー-龥]/, message:""}
    validates :address
    validates :phone, format:{with: /\A\d{10}\z|\A\d{11}\z/, message:""}
    validates :postal_code, format:{with: /\A[0-9]{3}-[0-9]{4}\z/, message:"は(-)を含めてください"}
    
    with_options numericality: {other_than: 1} do
      validates :area_id
    end
  end

  def save
    Order.create(postal_code: postal_code,municipality: municipality,address: address,building: building,phone: phone,order_id: order_id)
    history = History.create(item_id: item_id,user_id: user_id)
  end
end