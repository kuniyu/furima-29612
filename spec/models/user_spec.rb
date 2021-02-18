require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do
    it 'nicknameとemail、passwordとpassword_confirmation、last_nameとfirst_name、last_name_kanaとfirst_name_kana、birthdayが存在すれば登録できる' do
    end
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    
    it 'emailは@を含まなければ登録できない' do
      @user.email = 'abcde'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '000aa'
      @user.password_confirmation = '000aa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)",
      "Password is invalid",
      "Password confirmation is invalid")
    end 
    it 'passwordは半角英数字の混合でなければ登録できない' do
      @user.password = '000000'
      @user.password_confirmation = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid", "Password confirmation is invalid")
    end
    it 'ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力しなければ登録できない' do
      @user.last_name = 'jj'
      @user.first_name = 'jj'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角文字を使用してください", "Last name 全角文字を使用してください")
    end
    it 'ユーザー本名のフリガナは全角（カタカナ）で入力しなければ登録できない' do
      @user.last_name_kana = 'jj'
      @user.first_name_kana = 'jj'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana はカタカナで入力して下さい。", "First name kana はカタカナで入力して下さい。")
    end
  end
end
