class Animal < ApplicationRecord
  has_many :bookings
  belongs_to :user

  validates :name, presence: true

  has_one_attached :photo


  validates :breed, presence: true
  validates :age, presence: true
  validates :colour, presence: true
  validates :city, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :photo, presence: true

  def average
    ratings = self.bookings.pluck(:review_rating)
    average = ratings.reduce(:+) / ratings.size
  end
end
