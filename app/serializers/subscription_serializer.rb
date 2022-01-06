class SubscriptionSerializer
  def self.subscription(sub)
    {
      "data": {
        "id": sub.id,
        "type": 'subscription',
        "attributes": {
          "title": sub.title,
          "price": sub.price,
          "status": sub.status,
          "tea": sub.tea,
          "customer": sub.customer
        }
      }
    }
  end
end
