class SubscriptionSerializer
  include JSONAPI::Serializer
  attributes :title, :price, :status, :customer, :tea
end
