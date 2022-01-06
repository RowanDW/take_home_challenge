class Subscription < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true
  validates :status, presence: true

  belongs_to :customer
  belongs_to :tea
end
