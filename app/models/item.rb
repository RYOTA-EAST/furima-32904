class Item < ApplicationRecord
  belongs_to :user
  has_one :order

  with_options presence: false do
    validates :name
    validates :description
    validates :category_id
    validates :state_id
    validates :ship_day_id
    validates :price
    validates :user
  end
end
