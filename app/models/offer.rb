class Offer < ApplicationRecord
  validates :advertiser_name, :url, :description, :starts_at, presence: true
  validates :advertiser_name, uniqueness: { case_sensitive: false }
  validates :description, length: { maximum: 500 }
  validate :end_after_start
  validates :url, url: true

  scope :active, lambda { |date = Date.today| where("? >= starts_at AND ? <= ends_at AND state = TRUE OR ? >= starts_at and ends_at IS NULL AND state= TRUE", date, date, date) }

  private

  def end_after_start
    return if ends_at.blank? || starts_at.blank?

    if ends_at < starts_at
      errors.add(:ends_at, "must be after the start date")
    end
  end
end
