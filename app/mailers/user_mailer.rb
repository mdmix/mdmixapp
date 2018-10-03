class UserMailer < ApplicationMailer

  default from: "from@example.com"

  def contact_form(email, name, message)
  @message = message
    mail(from: email,
         to: 'max@maxdiamondmix.com',
         subject: "A brand-new contact-form shout-out from #{name}")
  end

end
