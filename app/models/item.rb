class Item < ApplicationRecord

  validates :image,             presence: true
  validates :item_name,         presence: true
  validates :item_text,         presence: true
  validates :category_id,       presence: true, numericality: { other_than: 1 } 
  validates :condition_id,      presence: true, numericality: { other_than: 1 }
  validates :shipping_fee_id,   presence: true, numericality: { other_than: 1 }
  validates :prefecture_id,     presence: true, numericality: { other_than: 1 }
  validates :shipping_date_id,  presence: true, numericality: { other_than: 1 }
  validates :price,             presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :user,              presence: true


  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_date

end
