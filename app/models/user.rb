class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  validates :nickname, :birthday, presence: true
  validates :last_name_kana, :first_name_kana, presence: true, 
                                               format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。' }
  validates :password, :password_confirmation, presence: true, 
                                               format: { with: /[a-z\d]{6,}/i, }

  
  



end
