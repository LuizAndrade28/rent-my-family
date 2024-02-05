class Review < ApplicationRecord
  belongs_to :user
  belongs_to :order

  validates :content, :rating, presence: true
  validates :rating, numericality: { greater_than: 0, less_than_or_equal_to: 5 }
  validates :order_id, uniqueness: true
end
