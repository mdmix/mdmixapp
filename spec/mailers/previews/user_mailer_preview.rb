# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def contact_form
    UserMailer.contact_form("negevrobin@netscape.net", "Max", "HEY HEY HEY!")
  end
  def welcome
    UserMailer.welcome(User.first)
  end
  def order_placement
    UserMailer.order_placement(User.first, Product, Product.first.name)
  end
end
