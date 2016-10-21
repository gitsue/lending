class Lender < ActiveRecord::Base
  has_secure_password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  has_many :borrowers
  has_many :histories
  has_many :borrowers_who_borrowed, through: :histories, source: :borrower
  validates :fname, :lname, :money, presence: true
  validates :email, uniqueness: true
  validates :email, presence: true, format: { with: EMAIL_REGEX }
  validates :password, length: {minimum: 8}, on: :create  
end
