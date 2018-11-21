if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_W4LPuZwugjoYk19Uzs2EiSSk',
    secret_key: 'sk_test_aVx9T58XBAnd7ffkfp1pOkOc'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
