class Order
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipal, :block_number, 
  :building_number, :phone_number, :purchase_id, :user_id, :item_id, :token


  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :municipal
    validates :block_number
    validates :phone_number
    validates :user_id
    validates :item_id
    validates :token
  end

  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/} do
  end

  validates :phone_number, format: {with: /\A[0-9]{3}-[0-9]{4}-[0-9]{4}\z/} do
  end

  def save
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipal: municipal, block_number: block_number, building_number: building_number, phone_number: phone_number)
    Purchase.create(user_id: user_id, item_id: item_id)
  end
 

end