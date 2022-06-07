class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :prefectures
  belongs_to :day_to_ship

  validates :category_id, :condition, :condition, :delivery_charge, :prefectures, :day_to_ship, numericality: { other_than: 1, message: "can't be blank" } 
end
