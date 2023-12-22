class AddressForm
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :block, :buildings_name, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code,    format: { with: /\A\d{3}-\d{4}\z/ }
    validates :prefecture_id,  numericality: { other_than: 1 }
    validates :city
    validates :block
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token
  end

  def save
    buy = Buy.create(user_id:, item_id:)
    Address.create(postal_code:, prefecture_id:, city:, block:,
                   buildings_name:, phone_number:, buy_id: buy.id)
  end
end
