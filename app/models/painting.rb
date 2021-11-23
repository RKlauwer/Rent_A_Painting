class Painting < ApplicationRecord
  belongs_to :user
  validates :author, length: { minimum: 2 }, presence: true
  validates :size, presence: true
  validates :price, presence: true
end
