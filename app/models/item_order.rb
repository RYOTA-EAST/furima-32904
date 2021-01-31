class ItemOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :explosive, :phone_number, :user_id, :item_id, :token
  #この中で作られたものは不要（外から来たのを指定）

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{11}\z/, message: "電話番号は１１桁以内です" }
    validates :token
  end

  validates :prefecture_id, numericality: { other_than:1 ,message: "can't be blank" }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    #orderに入れて下でidを追加
    ShipAddress.create(postal_code: postal_code,prefecture_id: prefecture_id,city: city,address: address,explosive: explosive,phone_number: phone_number, order_id: order.id)
  end
end