class Animal < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :bookings, dependent: :destroy
  belongs_to :user

  has_one_attached :photo

  validates :name, presence: true
  validates :breed, presence: true
  validates :birth_date, presence: true
  validates :colour, presence: true
  validates :address, presence: true
  validates :price, presence: true
  validates :description, presence: true

  scope :top_six, -> {
    joins(:bookings).group("animals.id").order("AVG(bookings.review_rating) DESC").limit(3)
  }


  def average
    if bookings.empty?
      return 0.0
    else
      bookings.average(:review_rating)
      # ratings = self.bookings.pluck(:review_rating)
      # return ratings.reduce(:+) / ratings.size
    end
  end
end
