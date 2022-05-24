class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :animals, through: :bookings
  validates :name, presence: true, length: { minimum: 3, maximum: 20 }
  has_many :bookings, dependent: :destroy

end
