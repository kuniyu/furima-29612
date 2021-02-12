class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,:validatable　

  validates :nickname, presence: true
  validates :last_name_kana, presence: true, format{with: /\A[\p{katakana --&&[^ -~.-°]]+\z/}
  validates :first_name_kana, presence: true, format{with: /\A[\p{katakana --&&[^ -~.-°]]+\z/}
  validates :first_name, presence: true, format:{with: /[^ -~.-°]+/}
  validates :first_name, presence: true, format:{with: /[^ -~.-°]+/}



end
