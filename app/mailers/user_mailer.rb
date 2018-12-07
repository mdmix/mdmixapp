class UserMailer < ApplicationMailer

  default from: "max@maxdiamondmix.com"

  def contact_form(email, name, message)
    @message = message
    mail(from: email,
         to: 'max@maxdiamondmix.com',
         subject: "A brand-new contact-form shout-out from #{name}")
  end

  def welcome(user)
      mail(
        :from => "max@maxdiamondmix.com",
        :to => user.email,
        :subject => "Welcome to The Mixer zone"
      )
  end

  def order_placement(user, product, name)
    # @user = user
    # @product = product
    # name = name
      mail(
        :from => "max@maxdiamondmix.com",
        :to => user.email,
        :subject => "Your order of #{name} is on-the-move"
      )
  end

end
