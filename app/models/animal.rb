class Animal < ApplicationRecord
  has_one_attached :photo
  has_many :bookings, dependent: :destroy
  belongs_to :user

  validates :name, uniqueness: true, presence: true
  validates :description, :species, :price, presence: true
end
