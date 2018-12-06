require 'rails_helper'

describe Comment do
  context "when user attempts to add comments" do
    before do
      @user = FactoryBot.create(:user)
      @product = FactoryBot.create(:product)
    end
    # let(:user) { User.create!(email: "youpi@netscape.net", password: "youpiyoupi") }

    it "is not valid when nothing is added to body" do
      expect(Comment.new(rating: 4, user: @user, body: "", product: @product)).to_not be_valid
    end

    it "is not valid when no rating is added" do
      expect(Comment.new(rating: "", user: @user, body: "Blah blah", product: @product)).to_not be_valid
    end

    it "is not valid when no registered user makes it" do
      expect(Comment.new(rating: 4, body: "Blah blah", user_id: "", product: @product)).to_not be_valid
    end

    it "is not valid without a properly IDed product" do
      expect(Comment.new(rating: 4, user: @user, body: "Blah blah", product_id: "")).to_not be_valid
    end

    it "is valid with a body, a rating, a registered user, a properly IDed product" do
      expect(Comment.new(rating: 4, user: @user, body: "Blah blah", product: @product)).to be_valid
    end

  end

end
