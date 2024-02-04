class FamilyMember < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_one_attached :photo
  belongs_to :user
end
