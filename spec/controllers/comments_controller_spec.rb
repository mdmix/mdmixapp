require 'rails_helper'
# require 'cancan/matchers'

  describe CommentsController, type: :controller do
    let(:userX) { User.create!(email: "woohoo@netscape.net", password: "woohoo", admin: false) }
    let(:userY) { User.create!(email: "youpi@netscape.net", password: "youpiyoupi", admin: true) }
    let(:product) { Product.create!(name: "Othello", description: "Good stuff", price: 25.0) }

    describe "POST #new" do
      context "when a non-admin-user is logged in" do

        before do
          sign_in userX
        end

        it "can create a new comment" do
          # ability.should be_able_to(:create, Comment.new(:user => userX))
          post :create, params: { product_id: product, comment: { body: "Good stuff", rating: 4} }
          expect(response).to have_http_status(302)
          expect(response).to render_template @product
        end

      end
    end

    describe "DELETE #destroy" do
      context "when an admin-user is logged in" do

        before do
          sign_in userX
        end

        it "can create and delete a comment" do
          @comment = product.comments.create!(rating: 1, user: userX, body: "Awful bike!")
          @comment.destroy
        end

      end
    end

  end
