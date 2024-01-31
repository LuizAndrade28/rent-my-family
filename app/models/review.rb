class Review < ApplicationRecord
  belongs_to :user
  belongs_to :family_member
end
