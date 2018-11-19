require 'rails_helper'

  describe UsersController, type: :controller do
    let(:userX) { User.create!(email: "woohoo@netscape.net", password: "woohoo") }
    let(:userY) { User.create!(email: "youpi@netscape.net", password: "youpiyoupi") }
    let(:userZ) { User.create!(email: "tralala@netscape.net", password: "tralala", admin: true) }

    describe "GET #index"do
      context "when a user is not logged in" do

        it 'redirects to login' do
          get :index
          expect(response).to redirect_to(new_user_session_path)
        end

      end
    end

    describe "GET #show" do
       context "when a user is logged in" do

         before do
           sign_in userX
         end

         it "loads correct user details" do
           get :show, params: { id: userX.id }
           expect(response).to be_ok
           expect(assigns(:user)).to eq userX
         end

       end

       context "when wrong user tries to access another user's details" do

          before do
            sign_in userY
          end

          it "redirects to 'products-index' root page" do
            get :show, params: { id: userX.id}
            expect(response).to redirect_to(root_path)
            expect(response).to have_http_status(302)
          end

        end

        context "when a user is not logged in" do

          it 'redirects to login' do
            get :show, params: { id: userX.id }
            expect(response).to redirect_to(new_user_session_path)
          end

        end

        context "when an admin-user attempts to access another user's details" do

          before do
            sign_in userZ
          end

          it "loads other user's correct details" do
            get :show, params: { id: userX.id }
            expect(response).to be_ok
            expect(assigns(:user)).to eq userX
          end

        end

      end

end
