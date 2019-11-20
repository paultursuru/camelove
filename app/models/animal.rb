class Animal < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :bookings
  belongs_to :user
  validates :name, presence: true, uniqueness: true
  validates :breed, presence: true
  validates :age, presence: true
  validates :colour, presence: true
  validates :address, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :photo, presence: true
end
