require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: @user.id, item_id: @item.id)
  end

  describe '購入情報の保存' do
    context '入力内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@purchase_address).to be_valid
      end
      it 'building_nameが空でも保存できる' do
        @purchase_address.building_name = ''
        expect(@purchase_address).to be_valid
      end
    end
    context '入力内容に問題がある場合' do
      it 'post_codeが空では保存できない' do
        @purchase_address.post_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("郵便番号を入力してください", "郵便番号に誤りがあります。ハイフンがあるか確認して下さい。")
      end
      it 'prefecture_idが空では保存できない' do
        @purchase_address.prefecture_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("都道府県を入力してください", "都道府県を選択して下さい")
      end
      it 'cityが空では保存できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("市町村を入力してください")
      end
      it 'house_numberが空では保存できない' do
        @purchase_address.house_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("番地を入力してください")
      end
      it 'phone_numberが空では保存できない' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("電話番号を入力してください", "電話番号は不正な値です")
      end
      it 'post_codeが3桁ハイフン4桁の半角文字列でない場合は保存できない' do
        @purchase_address.post_code = '1234-567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("郵便番号に誤りがあります。ハイフンがあるか確認して下さい。")
      end
      it 'post_codeにハイフンがない場合は保存できない' do
        @purchase_address.post_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("郵便番号に誤りがあります。ハイフンがあるか確認して下さい。")
      end
      it 'post_codeが全角文字列の場合は保存できない' do
        @purchase_address.post_code = '１２３−４５６７'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("郵便番号に誤りがあります。ハイフンがあるか確認して下さい。")
      end
      it 'prefecture_idが1の場合保存できない' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("都道府県を選択して下さい")
      end
      it 'phone_numberが10文字以下の場合は保存できない' do
        @purchase_address.phone_number = 123456789
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("電話番号は不正な値です")
        
      end
      it 'phone_numberが11文字以上の場合は保存できない' do
        @purchase_address.phone_number = 123456789012345
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'phone_numberが全角数字の場合保存できない' do
        @purchase_address.phone_number = '１２３４５６７８９０'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'user_idが紐付いていないと保存できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Userを入力してください")
      end
      it 'item_idが紐付いていないと保存できない' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Itemを入力してください")
      end
      it 'tokenが空では保存できない' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
    end
  end
end