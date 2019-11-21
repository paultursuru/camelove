class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :photo
  has_many :animals, dependent: :destroy
  has_many :bookings, dependent: :destroy
  # has_many :requests, through: :animals, class_name: 'Booking', foreign_key: :booking_id
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
