require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品' do
    before do
      @item = FactoryBot.build(:item)
    end
    
    context '商品出品がうまくいくとき' do
      it 'name,description,category_id,status_id,delivery_fee_id,prefecture_id,ship_day_id,price,imageが存在し登録できる
      ' do
        expect(@item).to be_valid
      end
      it 'priceが半角数字だと登録できる' do
        @item.price = '1000'
        expect(@item).to be_valid
      end
      it 'priceの値が300以上99999999以下であれば登録できる' do
        @item.price = '1000'
        expect(@item).to be_valid
      end
    end
    context '商品出品がうまくいかないとき' do
      it 'nameが空だと登録できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空だと登録できない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが1だと登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it 'status_idが1だと登録できない' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it 'delivery_fee_idが1だと登録できない' do
        @item.delivery_fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
      end
      it 'prefecture_idが1だと登録できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'ship_day_idが1だと登録できない' do
        @item.ship_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Ship day must be other than 1')
      end
      it 'priceが空だと登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'priceが半角でないと登録できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 半角数字で入力してださい。", "Price 価格は300円〜9999999円の範囲で入力してください。")
      end
      it 'priceが数字でないと登録できない' do
        @item.price = 'あいう'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 半角数字で入力してださい。", "Price 価格は300円〜9999999円の範囲で入力してください。")
      end
      it 'priceが300円以上でないと登録できない' do
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 価格は300円〜9999999円の範囲で入力してください。")
      end
      it 'priceが9999999円以下でないと登録できない' do
        @item.price = '100000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 価格は300円〜9999999円の範囲で入力してください。")
      end
    end
  end
end
