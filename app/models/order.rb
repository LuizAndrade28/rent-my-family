class Order < ApplicationRecord
  belongs_to :user
  belongs_to :family_member
  has_one :review, dependent: :destroy
end
