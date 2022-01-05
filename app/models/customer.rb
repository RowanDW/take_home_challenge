class Customer < ApplicationRecord

    validates :email, uniqueness: true, presence: true
    has_many :subscriptions
end
