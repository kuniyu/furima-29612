class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :password
    validates :password_confirmation
    validates :last_name
    validates :first_name
    validates :last_name_kana
    validates :first_name_kana
    validates :birthday
  end
  
  with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :last_name
  end 

  with_options format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。' } do
    validates :first_name_kana
    validates :last_name_kana
  end 
  
  with_options format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/} do
    validates :password
    validates :password_confirmation
  end
end




