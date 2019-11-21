class Animal < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :bookings
  belongs_to :user

  has_one_attached :photo

  validates :name, presence: true
  validates :breed, presence: true
  validates :birth_date, presence: true
  validates :colour, presence: true
  validates :address, presence: true
  validates :price, presence: true
  validates :description, presence: true

  def average
    ratings = self.bookings.pluck(:review_rating)
    average = ratings.reduce(:+) / ratings.size
  end
end
