require 'rails_helper'

RSpec.describe HistoryOrder, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @history_order = FactoryBot.build(:history_order, user_id: user.id, item_id: item.id)
      sleep(1)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@history_order).to be_valid
      end
      it 'buildingは空でも購入できること' do
        @history_order.building = ''
        expect(@history_order).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと購入できないこと' do
        @history_order.postal_code = ""
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと購入できないこと' do
        @history_order.postal_code = "1234567"
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("Postal code は(-)を含めてください")
      end
      it 'area_idを選択していないと購入できないこと' do
        @history_order.area_id = 1
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("Area を選択してください")
      end
      it 'municipalityが空だと購入できないこと' do
        @history_order.municipality = ""
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空だと購入できないこと' do
        @history_order.address = ""
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("Address can't be blank")
      end
      it 'phoneが空だと購入できないこと' do
        @history_order.phone = ""
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneは9桁以下だと購入できない' do
        @history_order.phone = "123456789"
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("Phone is invalid")
      end
      it 'phoneは12桁以上だと購入できない' do
        @history_order.phone = "090123456789"
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("Phone is invalid")
      end
      it 'tokenが空だと購入できない' do
        @history_order.token = ""
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いていないと購入できないこと' do
        @history_order.user_id = nil
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと購入できないこと' do
        @history_order.item_id = nil
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end