class Animal < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_one_attached :photo
  has_many :bookings, dependent: :destroy
  belongs_to :user

  validates :name, :description, :species, :price, :address, presence: true
  validates :photo, presence: true
end
