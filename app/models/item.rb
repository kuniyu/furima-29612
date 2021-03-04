class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :deliverytime
  belongs_to :prefecture
  belongs_to :shipping_fee
  belongs_to :condition
  belongs_to :category
  belongs_to :user
  has_one_attached :image
end
