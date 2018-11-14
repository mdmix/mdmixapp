require 'rails_helper'

describe User do
  context "when a user signs up"

    it "is is valid with an email and a password" do
      expect(User.new(email: "negevrobin@netscape.net", password: "YoupiYoupi")).to be_valid
    end

    it "is is not valid with an email but without a password" do
      expect(User.new(email: "negevrobin@netscape.net", password: "")).to_not be_valid
    end

    it "is is valid without an email but with a password" do
      expect(User.new(email: "", password: "YoupiYoupi")).to_not be_valid
    end

end
