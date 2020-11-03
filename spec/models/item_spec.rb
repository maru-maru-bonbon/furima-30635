require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item=FactoryBot.build(:item)
    @item.image = fixture_file_upload("app/assets/images/camera.png")
  end

  describe '商品出品機能' do
    context '商品が出品できるとき' do
      it "商品の画像、名前、説明、状態、カテゴリー、発送までの日数、配送料の負担、発送元の地域" do
        expect(@item).to be_valid
      end
    end

    context '商品が出品できないとき' do
      it '画像が空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      
      it '名前が空だと登録できない' do
        @item.name="" 
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "商品説明が空だと登録できない" do
        @item.description=""
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it "商品の状態が--だと登録できない" do
        @item.condition_id=1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end

      it "商品のカテゴリーが--だと登録できない" do
        @item.category_id=1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it "配送料の負担が--だと登録できない" do
        @item.shipping_charge_id=1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge must be other than 1")
      end

      it "発送元の地域が--だと登録できない" do
        @item.shipping_area_id=1
        @item.valid?
        expect(@item.errors.full_messages). to include("Shipping area must be other than 1")      
      end
      
      it "発送までの日数が--だと登録できない" do
        @item.delivery_time_id=1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time must be other than 1")
      end
    
      it "価格が空だと登録できない" do
        @item.selling_price=""
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price can't be blank")
      end
    
      it "価格が¥299以下だと登録できない" do
        @item.selling_price=299
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price must be greater than 299")
      end
      
      it "価格が¥9999999以上だと登録できない" do
        @item.selling_price=100000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price must be less than 9999999")
      end
    
      it "価格は全角数字だと登録できない" do
        @item.selling_price="４４４４"
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price is not a number")
      end
  

    end
  end
end
