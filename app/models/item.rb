class Item < ApplicationRecord

  validates :image,             presence: true
  validates :item_name,         presence: true
  validates :item_text,         presence: true
  validates :category_id,       presence: true
  validates :condition_id,      presence: true
  validates :shipping_fee_id,   presence: true
  validates :prefecture_id,     presence: true
  validates :shipping_date_id,  presence: true
  validates :price,             presence: true
  validates :user,              presence: true

  belongs_to :user
  has_one_attached :image

end
