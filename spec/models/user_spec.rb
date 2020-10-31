require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end 
  describe 'ユーザー新規登録' do
    context "新規登録がうまくいくとき" do
      it "ニックネーム、メールアドレス、名字と名前（カタカナも別に）、誕生日が必須である" do
        expect(@user).to be_valid
      end     
    end

    context "新規登録がうまくいかないとき" do
      
      it "メールアドレスが空だと登録できない" do
        @user.email=""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      
      it "メールアドレスが一意性である" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "メールアドレスに＠がないと登録できない" do
        @user.email="sss.com"
        @user.valid?
        expect(@user.errors.full_messages). to include("Email is invalid")
      end
      
      it "パスワードが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      
      it "パスワードは、半角英数字混合での入力が必須である" do
        @user.password = 'aaaaaaa'
        @user.password_confirmation = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers") 
      end

      it "パスワードが数字のみの場合は登録できない" do
        @user.password = "111111"
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password Include both letters and numbers")
      end

      it "パスワードがあっても、パスワード確認が空だと登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      
      it "ニックネームが空だと登録できない" do
        @user.nickname=""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end     
      
      it "名字は空だと登録できない" do
        @user.first_name=""
        @user.valid?
        expect(@user.errors.full_messages). to include("First name can't be blank")
      end
      
      it "名字は半角だと登録できない" do
        @user.last_name="ﾊﾝｶｸ"
        @user.valid?
        expect(@user.errors.full_messages). to include("Last name Full-width characters")
      end
      
      it "名前は空だと登録できない" do
        @user.last_name=""
        @user.valid?
        expect(@user.errors.full_messages). to include("Last name can't be blank")
      end
      
      it "名前は半角だと登録できない" do
        @user.first_name="ﾊﾝｶｸ"
        @user.valid?
        expect(@user.errors.full_messages). to include("First name Full-width characters")
      end
      
      it "名字(カタカナ)が空だと登録できない" do
        @user.first_katakana=""
        @user.valid?
        expect(@user.errors.full_messages). to include("First katakana can't be blank")
      end
      
      it "名字(カタカナ)が半角だと登録できない" do
        @user.first_katakana="ﾊﾝｶｸ"
        @user.valid?
        expect(@user.errors.full_messages). to include("First katakana Full-width katakana characters")
      end
      
      it "名前(カタカナ)が空だと登録できない" do
        @user.last_katakana=""
        @user.valid?
        expect(@user.errors.full_messages). to include("Last katakana can't be blank")
      end
      
      it "名前(カタカナ)が半角だと登録できない" do
        @user.last_katakana="ﾊﾝｶｸ"
        @user.valid?
        expect(@user.errors.full_messages). to include("Last katakana Full-width katakana characters")
      end
        
      it "生年月日が空だと登録できない" do
        @user.birthday=""
        @user.valid?
        expect(@user.errors.full_messages). to include("Birthday can't be blank")
      end
    end
  end
end
