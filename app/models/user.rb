class User < ApplicationRecord 
  validates_presence_of :name, :email 
  validates_uniqueness_of :email

  has_secure_password

  has_many :user_viewing_parties
  has_many :viewing_parties, through: :user_viewing_parties
end