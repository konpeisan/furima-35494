class HistoryOrder
  include ActiveModel::Model
  attr_accessor :postal_code,:area_id,:municipality,:address,:building,:phone,:item_id,:user_id,:history_id,:token

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :postal_code, format:{with: /\A[0-9]{3}-[0-9]{4}\z/, message:"は(-)を含めてください"}
    validates :municipality, format:{with: /\A[ぁ-んァ-ンー-龥]/}
    validates :address
    validates :phone, format:{with: /\A\d{10}\z|\A\d{11}\z/}
    validates :area_id, numericality: {other_than: 1, message:"を選択してください"}
  end

  def save
    history = History.create(item_id: item_id,user_id: user_id)
    Order.create(history_id: history.id,postal_code: postal_code,area_id: area_id,municipality: municipality,address: address,building: building,phone: phone)
  end
end