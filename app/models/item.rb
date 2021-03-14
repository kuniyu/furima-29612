class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :deliverytime

  with_options presence: true do
    validates :image
    validates :product_name
    validates :describe
    validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
  end

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :prefectures_id
    validates :delivery_time_id
  end

  validates :price, numericality: { only_integer: true }
  

  
end
