class Borrower < ActiveRecord::Base
  has_secure_password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  has_many :histories
  has_many :lenders
  has_many :lenders_who_lended, through: :histories, source: :lender
  validates :fname, :lname, :money, :purpose, :description, presence: true
  validates :email, presence: true, format: { with: EMAIL_REGEX }
  validates :email, uniqueness: true
  validates :password, length: {minimum: 8}, on: :create

end
