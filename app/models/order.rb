class Order < ApplicationRecord
  belongs_to :user
  belongs_to :family_member
  has_one :review, dependent: :destroy

  validates :quantity_hour, :rent_date, presence: true
  validates :quantity_hour, numericality: { greater_than: 0 }
  validate :rent_date_cannot_be_in_the_past

  private

  def rent_date_cannot_be_in_the_past
    if rent_date.present? && rent_date < Date.today
      errors.add(:rent_date, "can't be in the past")
    end
  end
end
