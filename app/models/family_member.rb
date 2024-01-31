class FamilyMember < ApplicationRecord
  belongs_to :user
  belongs_to :order
  has_many :reviews, dependent: :destroy
end
