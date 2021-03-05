class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :deliverytime
  belongs_to :prefecture
  belongs_to :shipping_fee
  belongs_to :condition
  belongs_to :category
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :product_name
    validates :describe
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :prefectures_id
    validates :delivery_time_id
    validates :price
  end

  validates :price, format: { with: /^[0-9０-９]+$/ }
end
