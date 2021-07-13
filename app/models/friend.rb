class Friend < ApplicationRecord
  validates :twitter, presence: true
  validates :first_name, :last_name, format: {with: /\A[a-zA-Z]+\z/, message: "only allows letters"}
  validates :phone, format: {with: /(\+|1\s)?\W*([2-9][0-8][0-9])\W*([2-9][0-9]{2})\W([0-9]{4})?/, message: " Number is not in correct format"}
  validates :email, format: Devise.email_regexp
  validates :first_name, :last_name, length: {maximum: 20}, allow_blank: false
  validates :phone, format: {with: /\d[0-9]+\z/, message: " Number is not in correct format"}
end
