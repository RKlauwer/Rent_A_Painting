class Painting < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :bookings
  validates :author, length: { minimum: 2 }, presence: true
  validates :size, presence: true
  validates :price, presence: true
end
