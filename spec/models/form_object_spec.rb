require 'rails_helper'

RSpec.describe FormObject, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload("app/assets/images/camera.png")
    @form_object=FactoryBot.build(:form_object,user_id: @user.id,item_id: @item.id)
  end

  describe '商品購入機能' do
    context '商品が購入できるとき' do
      it "postal_code,prefecture_id,municipality,address,phone_number,tokenが必須" do
        expect(@form_object).to be_valid
      end

      it "building_nameが空でも登録できる" do
        @form_object.building_name = ""
        expect(@form_object).to be_valid
      end
    end

    context '商品が購入できないとき' do
      it 'postal_codeが空だと登録できない' do
        @form_object.postal_code = ""
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Postal code can't be blank")
      end
      
      it "postal_codeにハイフン(-)が含まれていないと登録できない" do
        @form_object.postal_code = 222222
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it 'prefecture_idが--だと登録できない' do
        @form_object.prefecture_id=1
        @form_object.valid?
        expect(@form_object.errors.full_messages). to include("Prefecture Select") 
      end

      it "municipalityが空だと登録できない" do
        @form_object.municipality=""
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Municipality can't be blank")
      end

      it "addressが空だと登録できない" do
        @form_object.address=""
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Address can't be blank")
      end

      it "phone_numberが空だと登録できない" do
        @form_object.phone_number=""
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Phone number can't be blank")
      end

      it "phone_numberが11桁以上だと登録できない" do
        @form_object.phone_number="0123456789123"
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end

      it "phone_numberにハイフン(-)が入っていると登録できない" do
        @form_object.phone_number="0123-456"
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Phone number is not a number")
      end

      it "tokenが空だと登録できない" do
        @form_object.token= nil
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
