require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order, user_id: user.id, item_id: item.id)
    sleep (0.5)
  end
    
  describe '商品購入機能' do
    context '商品が購入できるとき' do
      it 'postal_code,prefecture,municipal,block_number,building_number,phone_number,user_id,item_id,tokenがあれば購入できる' do
        expect(@order).to be_valid
      end
      it 'building_numberが空でも購入できる' do
        @order.building_number = ''
        expect(@order).to be_valid
      end
    end
    context '商品が購入できないとき' do
      it 'postal_codeが空では保存できない' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
        @order.postal_code = '99999999'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid")
      end
      it 'prefecture_idがないと保存できない' do
        @order.prefecture_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it 'municipalは空では保存できない' do
        @order.municipal = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipal can't be blank")
      end
      it 'block_numberは空では保存できない' do
        @order.block_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Block number can't be blank")
      end
      it 'phone_numberは空では保存できない' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberにハイフンが含まれていると保存できない' do
        @order.phone_number = '000-0000000'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberに全角が含まれていると保存できない' do
        @order.phone_number = '０００００００００００'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが12桁以上だと保存できない' do
        @order.phone_number = '000000000000'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end
      it 'tokenが空では保存できない' do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空では保存できない' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では保存できない' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end