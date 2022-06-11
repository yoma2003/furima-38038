class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :order_id

  def save
    order = Order.create(user_id: user_id,item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id,municipality: municipality, address: address, building_name: building_name, phone_number: phone_number,order_id: order.id)
  end
end