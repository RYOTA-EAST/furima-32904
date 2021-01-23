class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :ship_pay
  belongs_to :prefecture
  belongs_to :ship_day

  belongs_to :user
  has_one :order
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :description
    validates :user
    validates :image
    validates :price
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :state_id
    validates :ship_pay_id
    validates :prefecture_id
    validates :ship_day_id
  end

  validates :price, numericality: { only_integer: true }

  validates :price,
            numericality: {
              greater_than_or_equal_to: 300,
              less_than_or_equal_to: 9_999_999,
              message: '入力値が300~9999999の範囲外です'
            }
end
