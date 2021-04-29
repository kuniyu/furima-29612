class Order
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipal, :block_number, 
  :building_number, :phone_number, :user_id, :item_id, :token
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :municipal
    validates :block_number
    validates :phone_number, format: { with: VALID_PHONE_REGEX } 
    validates :user_id
    validates :item_id
    validates :token
  end


  

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipal: municipal, block_number: block_number, building_number: building_number, phone_number: phone_number, purchase_id: purchase.id)
  end
 

end