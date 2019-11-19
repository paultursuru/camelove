class Booking < ApplicationRecord
  belongs_to :animal
  belongs_to :user
  validates :date_in, presence: true
  validates :date_out, presence: true
  # validates :review_rating, inclusion: { in: [1, 2, 3, 4, 5] }
end
