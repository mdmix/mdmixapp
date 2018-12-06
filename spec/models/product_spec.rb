require 'rails_helper'

describe Product do
  context "when the product has comments" do
    before do
      @product = FactoryBot.create(:product)
      # let(:product) { Product.create!(name: "Othello", description: "Good stuff") }
      @user = FactoryBot.create(:user)
      # let(:user) { User.create!(email: "youpi@netscape.net", password: "youpiyoupi") }
      @product.comments.create!(rating: 1, user: @user, body: "Bad stuff!")
      @product.comments.create!(rating: 3, user: @user, body: "So-so stuff!")
      @product.comments.create!(rating: 5, user: @user, body: "Amazing stuff!")
    end

    it "returns the average rating of all comments" do
      expect(@product.average_rating).to eq 3
    end

    it "returns the most highly rated comment" do
      expect(@product.highest_rating_comment.rating).to eq (5)
    end

    it "returns the most lowly rated comment" do
      expect(@product.lowest_rating_comment.rating).to eq (1)
    end

    it "is not valid without a name" do
      expect(Product.new(description:"Good stuff", price: 59.0)).to_not be_valid
    end

    it "is not valid without a price" do
      expect(Product.new(name: "Yey", description: "Great stuff")).to_not be_valid
    end

    it "is not valid without a description" do
      expect(Product.new(name: "Yey", price: 59.0)).to_not be_valid
    end

    it "is valid with a name, a price, and a description" do
      expect(Product.new(name: "Yey", price: 59.0, description: "Great stuff")).to be_valid
    end

  end

end
