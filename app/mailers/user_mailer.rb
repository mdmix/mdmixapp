class UserMailer < ApplicationMailer

  default from: "max@maxdiamondmix.com"

  def contact_form(email, name, message)
  @message = message
    mail(from: email,
         to: 'max@maxdiamondmix.com',
         subject: "A brand-new contact-form shout-out from #{name}")
  end

  # def welcome(user, email)
  #   mail(to: user.email,
  #        subject: "Welcome to The Mixer zone!!! Feel free to give us a shout!!!")
  # end

  def welcome (user)
    unless user.nil?
      mail(
        :from => "max@maxdiamondmix.com",
        :to => user.email,
        :subject => "Welcome to The Mixer zone"
      )
    else
      mail(
        :from => "max@maxdiamondmix.com",
        :to => "test@mail.com",
        :subject => "Welcome to The Mixer zone"
      )
    end
  end

end
