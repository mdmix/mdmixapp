class UserMailer < ApplicationMailer

  default from: "max@maxdiamondmix.com"

  def contact_form(email, name, message)
  @message = message
    mail(from: email,
         to: 'max@maxdiamondmix.com',
         subject: "A brand-new contact-form shout-out from #{name}")
  end

  def welcome (user)
      mail(
        :from => "max@maxdiamondmix.com",
        :to => user.email,
        :subject => "Welcome to The Mixer zone"
      )
  end

  def order_happening (user, product)
    @user = user
    @product = product
    # @product = product
      mail(
        :from => "max@maxdiamondmix.com",
        :to => user.email,
        :subject => "Your order of #{product} is on-the-move"
      )
  end

end
