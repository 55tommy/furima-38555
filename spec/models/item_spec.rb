require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品ができる場合' do
      it 'product_name, description, category_id, condition_id, price, delivery_charge_id, prefecture_id, delivery_period_id, imageが存在すればDBに保存できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品ができない場合' do
      it 'product_nameが空では保存できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it 'descriptionが空では保存できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品説明を入力してください")
      end
      it 'category_idが空では保存できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択して下さい", "カテゴリーを入力してください")
      end
      it 'category_idが「---」では保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択して下さい")
      end
      it 'condition_idが空では保存できない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選択して下さい", "商品の状態を入力してください")
      end
      it 'condition_idが「---」では保存できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選択して下さい")
      end
      it 'priceが空では保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください", "価格は数値で入力してください")
      end
      it 'delivery_charge_idが空では保存できない' do
        @item.delivery_charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選択して下さい", "配送料の負担を入力してください")
      end
      it 'delivery_charge_idが「---」では保存できない' do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選択して下さい")
      end
      it 'prefecture_idが空では保存できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("地域を選択して下さい", "地域を入力してください")
      end
      it 'prefecture_idが「---」では保存できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("地域を選択して下さい")
      end
      it 'delivery_period_idが空では保存できない' do
        @item.delivery_period_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("発送期日を選択して下さい", "発送期日を入力してください")
      end
      it 'delivery_period_idが「---」では保存できない' do
        @item.delivery_period_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送期日を選択して下さい")
      end
      it 'imageが空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Userを入力してください")
      end
      it 'priceは¥300以下のとき保存できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は299より大きい値にしてください")
      end
      it 'priceは¥10000000以上のとき保存できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は10000000より小さい値にしてください")
      end
      it 'priceは半角数値のみでないと保存できない' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は数値で入力してください")
      end
    end

  end

end
