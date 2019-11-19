class Animal < ApplicationRecord
  has_many :bookings
  belongs_to :user
  validates :name, presence: true, uniqueness: true
  validates :breed, presence: true
  validates :age, presence: true
  validates :colour, presence: true
  validates :city, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :photo, presence: true
end
