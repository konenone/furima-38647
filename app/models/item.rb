class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :days_to_ship
  belongs_to :shipping_area
  belongs_to :shipping_charge
  belongs_to :status
  
  has_one_attached :image

  belongs_to :user
  #has_one :purchase_record

  with_options presence: true do
    validates :image
    validates :name
    validates :introduction
    validates :category_id
    validates :status_id
    validates :shipping_charge_id
    validates :shipping_area_id
    validates :days_to_ship_id
    # 300円以上かつ9,999,999円以下で、半角数字でないと入力不可
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :shipping_area_id
    validates :status_id
    validates :shipping_charge_id
    validates :days_to_ship_id
  end
end
