class FamilyMember < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_one_attached :photo
  belongs_to :user

  validates :first_name, :last_name, :kinship, :description, :profile_title, :value_hour, presence: true
  validates :value_hour, numericality: { greater_than: 0 }
end
