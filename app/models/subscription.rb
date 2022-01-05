class Subscription < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true
  validates :status, presence: true
  validates :tea, presence: true
  validates :customer, presence: true

  belongs_to :customer
  belongs_to :tea
end
