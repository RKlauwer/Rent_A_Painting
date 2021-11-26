class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookings
  has_many :booked_paintings, through: :bookings, class_name: 'Painting', source: :painting
  # owned
  has_many :paintings

  validates :first_name, presence: true
  validates :last_name, presence: true
end
