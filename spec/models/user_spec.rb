require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザーの新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
    
    context '新規登録がうまくいくとき' do
      it "nickname,email,password,password_confirmation,last_name,first_name,last_name_furigana,first_name_furigana,birthdayが存在すれば登録できる
      " do
        expect(@user).to be_valid
      end
      it "passwordが６文字以上だと登録できる" do
        @user.password = "abc123"
        @user.password_confirmation = "abc123"
        expect(@user).to be_valid
      end
      it "passwordが半角英数字混合だと登録できる" do
        @user.password = "abc123"
        @user.password_confirmation = "abc123"
        expect(@user).to be_valid
      end
      it "last_nameが全角(漢字、ひらがな、カタカナ)だと登録できる" do
        @user.last_name = "亞あア"
        expect(@user).to be_valid
      end
      it "first_nameが全角(漢字、ひらがな、カタカナ)だと登録できる" do
        @user.first_name = "亞あア"
        expect(@user).to be_valid
      end
      it "last_name_furiganaが全角カタカナだと登録できる" do
        @user.last_name_furigana = "アアア"
        expect(@user).to be_valid
      end
      it "first_name_furiganaが全角カタカナだと登録できる" do
        @user.first_name_furigana = "アアア"
        expect(@user).to be_valid
      end
    end
    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailが重複していると登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空だと登録できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが５文字以下だと登録できない" do
        @user.password = "abc12"
        @user.password_confirmation = "abc12"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが半角でないと登録できない" do
        @user.password = "１２３ａｂｃ"
        @user.password_confirmation = "１２３ａｂｃ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 英数字を両方含み、半角で入力してください")
      end
      it "passwordが英数字混合でないと登録できない" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 英数字を両方含み、半角で入力してください")
      end
      it "passwordとpassword_confirmationが一致しなければ登録できない" do
        @user.password = "123456"
        @user.password_confirmation = "1234567"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "last_nameが空だと登録できない" do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "last_nameが全角でないと登録できない" do
        @user.last_name = "ｱｶｻ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角の漢字・ひらがな・カタカナで入力してください")
      end
      it "last_nameが(漢字、ひらがな、カタカナ)でないと登録できない" do
        @user.last_name = "abc"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角の漢字・ひらがな・カタカナで入力してください")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_nameが全角でないと登録できない" do
        @user.first_name = "ｱｶｻ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角の漢字・ひらがな・カタカナで入力してください")
      end
      it "first_nameが(漢字、ひらがな、カタカナ)でないと登録できない" do
        @user.first_name = "abc"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角の漢字・ひらがな・カタカナで入力してください")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "last_name_furiganaが空だと登録できない" do
        @user.last_name_furigana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name furigana can't be blank")
      end
      it "last_name_furigana,が全角カタカナでないと登録できない" do
        @user.last_name_furigana = "ｱｶｻ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name furigana 全角のカタカナで入力してください")
      end
      it "first_name_furiganaが空だと登録できない" do
        @user.first_name_furigana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name furigana can't be blank")
      end
      it "first_name_furiganaが全角カタカナではないと登録できない" do
        @user.first_name_furigana = "ｱｶｻ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name furigana 全角のカタカナで入力してください")
      end
      it "birthdayが空だと登録できない" do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
