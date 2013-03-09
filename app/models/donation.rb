class Donation
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :token, :amount

  validates_presence_of :token, :amount

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

  def save
    Stripe::Charge.create(
      :amount => amount,
      :card => token,
      :currency => "usd"
    )
  end
end
