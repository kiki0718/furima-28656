require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe '郵送先の保存' do
    before do
      @purchase = FactoryBot.build(:purchase)
    end

    context '商品出品がうまくいくとき' do
     it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @purchase.building_name = nil
        expect(@purchase).to be_valid
      end
    end
    context '商品出品がうまくいかないとき' do
      it 'tokenが空だと保存できないこと' do
        @purchase.token = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと保存できないこと' do
        @purchase.postal_code = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase.postal_code = '1234567'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'prefectureを選択していないと保存できないこと' do
        @purchase.prefecture_id = 1
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipatitiesが空だと保存できないこと' do
        @purchase.municipatities = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Municipatities can't be blank")
      end
      it 'house_numberが空だと保存できないこと' do
        @purchase.house_number = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @purchase.phone_number = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが半角のハイフンなしで11桁以内の正しい形式でないと保存できないこと' do
        @purchase.phone_number = '123456123456'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが数字のみでないと保存できないこと' do
        @purchase.phone_number = '123abc456'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end
