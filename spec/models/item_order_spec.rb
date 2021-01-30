require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  describe 'orderの保存' do
    before do
      @item_order = FactoryBot.build(:item_order)
    end

    describe "保存できる場合" do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@item_order).to be_valid
      end
    end

    describe "保存できない場合" do
      it '郵便番号が空だと保存できないこと' do
        @item_order.postal_code = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイホンがないと保存できないこと' do
        @item_order.postal_code = "1234567"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '都道府県が選択されていないと保存できないこと' do
        @item_order.prefecture_id = 1
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市町村が空だと保存できないこと' do
        @item_order.city = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @item_order.address = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @item_order.phone_number = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone number can't be blank")
      end
      it '郵便番号が12文字以上だと保存できないこと' do
        @item_order.phone_number = '080222233332'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone number 電話番号は１１桁以内です")
      end
    end

  end
end
