require 'rails_helper'

describe Order do
  context "when an order is placed" do
    before do
      @user = FactoryBot.create(:user)
      # let(:user) { User.create!(email: "youpi@netscape.net", password: "youpiyoupi") }
      @product = FactoryBot.create(:product)
      # let(:product) { Product.create!(name: "Touch of Evil", description: "Good stuff", price: 59.0) }
    end

    it "is not valid if a user but no product feature in it" do
      expect(Order.new(user: @user, total: 59.0)).not_to be_valid
    end

    it "is not valid if a product but no user feature in it" do
      expect(Order.new(product: @product, total: 59.0)).not_to be_valid
    end

    it "is valid if a user and a product feature in it" do
      expect(Order.new(user: @user, product: @product, total: 59.0 )).to be_valid
    end

  end

end
