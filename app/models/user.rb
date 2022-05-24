class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :animals
  has_many :bookings, dependent: :destroy
  has_many :animals, through: :bookings

  # VALID_EMAIL_REGEX = '.+@.+(.org|.fr|.com)'

  validates :name, presence: true, length: { minimum: 3, maximum: 20 }
  # validates :password, presence: true, length: { minimum: 7, maximum: 30 }
  # validates :email, presence: true, length: { minimum: 10, maximum: 40 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
end
