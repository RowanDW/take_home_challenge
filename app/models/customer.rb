class Customer < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :email, uniqueness: true, presence: true

  has_many :subscriptions, dependent: :destroy
end
