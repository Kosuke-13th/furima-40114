require 'rails_helper'

RSpec.describe AddressForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @buy = FactoryBot.build(:address_form, user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入' do
    context '商品購入できるとき' do
      it 'postal_codeと、prefecture_idと、cityと、blockと、buildings_nameと、phone_numberと、item_idと、user_idと、tokenが存在すれば登録できる' do
        expect(@buy).to be_valid
      end
      it 'buildings_nameが存在しなくても登録できる' do
        @buy.buildings_name = ''
        expect(@buy).to be_valid
      end
    end

    context '商品購入できないとき' do
      it 'postal_codeが空では登録できない' do
        @buy.postal_code = ''
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeは3桁ハイフン4桁でないと登録できない' do
        @buy.postal_code = '1110000'
        @buy.valid?
        expect(@buy.errors.full_messages).to include('Postal code is invalid')
      end

      it 'postal_codeは半角数字でないと登録できない' do
        @buy.postal_code = '１１１-１１１１'
        @buy.valid?
        expect(@buy.errors.full_messages).to include('Postal code is invalid')
      end

      it 'prefecture_idが空では登録できない' do
        @buy.prefecture_id = ''
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefecture_idがid 1(---)では登録できない' do
        @buy.prefecture_id = 1
        @buy.valid?
        expect(@buy.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it 'cityが空では登録できない' do
        @buy.city = ''
        @buy.valid?
        expect(@buy.errors.full_messages).to include("City can't be blank")
      end

      it 'blockが空では登録できない' do
        @buy.block = ''
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Block can't be blank")
      end

      it 'phone_numberが空では登録できない' do
        @buy.phone_number = ''
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが9桁以下では登録できない' do
        @buy.phone_number = '090111111'
        @buy.valid?
        expect(@buy.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberが12桁以上では登録できない' do
        @buy.phone_number = '090111111111'
        @buy.valid?
        expect(@buy.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberが全角では登録できない' do
        @buy.phone_number = '０９０１１１１１１１１'
        @buy.valid?
        expect(@buy.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberはハイフンなしでしか登録できない' do
        @buy.phone_number = '090-1111-1111'
        @buy.valid?
        expect(@buy.errors.full_messages).to include('Phone number is invalid')
      end

      it 'userが紐付いていないと保存できない' do
        @buy = FactoryBot.build(:address_form, user_id: nil, item_id: @item.id)
        @buy.valid?
        expect(@buy.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていないと保存できない' do
        @buy = FactoryBot.build(:address_form, user_id: @user.id, item_id: nil)
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Item can't be blank")
      end

      it 'tokenが空では登録できないこと' do
        @buy.token = nil
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
