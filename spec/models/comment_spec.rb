require 'rails_helper'

describe Comment do
  context "when user attempts to add comments"
    let(:user) { User.create!(email: "youpi@netscape.net", password: "youpiyoupi") }

    it "is not valid when nothing is added to body" do
      expect(Comment.new(rating: 4, user: user, body: "")).to_not be_valid
    end

    it "is not valid when no rating is added" do
      expect(Comment.new(rating: "", user: user, body: "Blah blah")).to_not be_valid
    end

end
