require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do
    context "新規登録ができる場合" do
      it 'nicknameとemail、passwordとpassword_confirmation、last_nameとfirst_name、last_name_kanaとfirst_name_kana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'emailは@を含んでいれば登録できる' do
        @user.email = 'abcde@g.com'
        expect(@user).to be_valid
      end
      it '重複したemailが存在しない場合登録できる' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = 'abcde@g.com'
        expect(@user).to be_valid
      end
      it 'passwordが６文字以上で登録できる' do
        @user.password = '000aaa'
        @user.password_confirmation = '000aaa'
        expect(@user).to be_valid
      end
      it 'passwordは半角英数字の混合であれば登録できる' do
        @user.password = '000aaa'
        @user.password_confirmation = '000aaa'
        expect(@user).to be_valid
      end
      it 'ユーザーの名字は全角（漢字・ひらがな・カタカナ）で入力すれば登録できる' do
        @user.last_name = '木村'
        expect(@user).to be_valid
      end
      it 'ユーザーの名前は全角（漢字・ひらがな・カタカナ）で入力すれば登録できる' do
        @user.first_name = '浩一'
        expect(@user).to be_valid
      end 
      it 'ユーザーの名字のフリガナは全角（カタカナ）で入力' do
        @user.last_name_kana = 'キムラ'
        expect(@user).to be_valid
      end
      it 'ユーザーの名前のフリガナは全角（カタカナ）で入力' do
        @user.first_name_kana = 'コウイチ'
        expect(@user).to be_valid
      end
       
    end
    context "新規登録ができない場合" do
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
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
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
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordは英語のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid", "Password confirmation is invalid")
      end
      it 'passwordは全角では登録できない' do
        @user.password = '０００aaa'
        @user.password_confirmation = '０００aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid", "Password confirmation is invalid")
      end    
      it 'passwordは半角英数字の混合でなければ登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid", "Password confirmation is invalid")
      end
      it 'ユーザー名字は全角（漢字・ひらがな・カタカナ）で入力しなければ登録できない' do
        @user.last_name = 'jj'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
      end
      it 'ユーザー名前は全角（漢字・ひらがな・カタカナ）で入力しなければ登録できない' do
        @user.first_name = 'jj'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
      end
      it 'ユーザー名字のフリガナは全角（カタカナ）で入力しなければ登録できない' do
        @user.last_name_kana = 'jj'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana はカタカナで入力して下さい。")
      end
      it 'ユーザー名前のフリガナは全角（カタカナ）で入力しなければ登録できない' do
        @user.first_name_kana = 'jj'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana はカタカナで入力して下さい。")
      end
    end
  end
end
