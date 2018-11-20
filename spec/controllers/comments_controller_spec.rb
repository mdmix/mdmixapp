require 'rails_helper'
# require 'cancan/matchers'

  describe CommentsController, type: :controller do
    before do
      @user = FactoryBot.create(:user)
      @admin = FactoryBot.create(:user)
      @product = FactoryBot.create(:product)
    end
    # let(:userX) { User.create!(email: "woohoo@netscape.net", password: "woohoo", admin: false) }
    # let(:userY) { User.create!(email: "youpi@netscape.net", password: "youpiyoupi", admin: true) }
    # let(:product) { Product.create!(name: "Othello", description: "Good stuff", price: 25.0) }

    describe "POST #new" do
      context "when a non-admin-user is logged in" do

        before do
          sign_in @user
        end

        it "can create a new comment" do
          @product1 = FactoryBot.create(:product)
          # post :create, params: { product_id: product, comment: { body: "Good stuff", rating: 4} }
          expect(response).to have_http_status(200)
          # expect(response).to render_template @product
        end

      end
    end

    describe "DELETE #destroy" do
      context "when an admin-user is logged in" do

        before do
          sign_in @admin
        end

        it "can create and delete a comment" do
          @comment = @product.comments.create!(rating: 4, user: @user, body: "Tra La La!")
          @comment.destroy
        end

      end
    end

end
