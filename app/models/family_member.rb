class FamilyMember < ApplicationRecord
  #belongs_to :order
  has_many :reviews, dependent: :destroy
  has_many :orders, dependent: :destroy
end
