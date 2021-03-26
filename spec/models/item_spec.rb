require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できるとき' do
      it 'image,product_name,describe,category_id,condition_id,shipping_fee_id,prefecture_id,deliverytime_id,priceがあれば出品できる' do
        expect(@item).to be_valid
      end
      it 'priceが300円なら出品できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
      it 'priceが9,999,999円なら出品できる' do
        @item.price = 9_999_999
        expect(@item).to be_valid
      end
      it 'priceが半角なら出品できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
    end
    context '商品出品できないとき' do
      it 'imageがないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'product_nameがないと出品できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it 'describeがないと出品できない' do
        @item.describe = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Describe can't be blank")
      end
      it 'category_idがないと出品できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end
      it 'condition_idがないと出品できない' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 0")
      end
      it 'shipping_fee_idがないと出品できない' do
        @item.shipping_fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee must be other than 0")
      end
      it 'prefecture_idがないと出品できない' do
        @item.prefectures_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefectures must be other than 0")
        
      end
      it 'deliverytime_idがないと出品できない' do
        @item.delivery_time_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time must be other than 0")
      end
      it 'priceがないと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not included in the list", "Price is invalid", "Price is not a number")
      end
      it 'priceが300円以下だと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it 'priceが9,999,999円以上だと出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it 'priceが半角数字でないと出品できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list", "Price is not a number")
      end
      it "priceが半角英数混合では登録できないこと" do
        @item.price = "300dollars"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "priceが半角英語だけでは登録できないこと" do
        @item.price = "threemillion"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list", "Price is not a number")
      end
    end
  end
end
