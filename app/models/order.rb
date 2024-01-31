class Order < ApplicationRecord
  belongs_to :user
  has_many :family_members, dependent: :destroy
end
