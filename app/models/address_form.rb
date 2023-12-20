class AddressForm
  include ActiveModel::Model

  attr_accessor :user_id,:item_id,:postal_code,:prefecture_id,:city,:block,:buildings_name,:phone_number

  validates :user_id,           presence: true
  validates :item_id,           presence: true
  validates :postal_code,       presence: true, format: {with: /\A\d{3}[-]\d{4}\z/}
  validates :prefecture_id,     presence: true, numericality: { other_than: 1 }
  validates :city,              presence: true
  validates :block,             presence: true
  validates :phone_number,      presence: true, format: {with: /\A\d{10,11}\z/}


  def save
    buy = Buy.create(user_id:user_id, item_id: item_id)
    Address.create(postal_code:postal_code,prefecture_id:prefecture_id,city:city,block:block,
    buildings_name:buildings_name,phone_number:phone_number,buy_id:buy.id)

  end

end