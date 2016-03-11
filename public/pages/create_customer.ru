# Set your secret key: remember to change this to your live secret key in production
# See your keys here https://dashboard.stripe.com/account/apikeys
Stripe.api_key = "sk_test_4OlzpszvpDJWBNrg7EAl6v3b"

# Get the credit card details submitted by the form
token = params[:stripeToken]

# Create a Customer
customer = Stripe::Customer.create(
  :source => token,
  :plan => "gold",
  :email => "payinguser@example.com"
)