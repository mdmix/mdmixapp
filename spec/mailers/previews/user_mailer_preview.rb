# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def contact_form
    UserMailer.contact_form("negevrobin@netscape.net", "Max", "HEY HEY HEY!")
  end
  def welcome
    UserMailer.welcome(User.first)
  end
  def order_happening
    UserMailer.order_happening(User.first, Product.first.name)
  end
end
