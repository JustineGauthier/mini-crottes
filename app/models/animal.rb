class Animal < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings

  validates :name, uniqueness: true, presence: true
  validates :description, :species, :price, presence: true
end
