class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :shipping_area_id, :municipalities, :address, :building_name, :phone_number, :token

  
  with_options presence: true do
    validates :user_id
    validates :item_id
    
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :shipping_area_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :municipalities
    validates :address
    validates :phone_number, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }
    
    validates :token, presence: true
  end


  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(purchase_record_id: purchase_record.id, post_code: post_code, shipping_area_id: shipping_area_id, municipalities: municipalities, address: address, building_name: building_name, phone_number: phone_number)

  end
end