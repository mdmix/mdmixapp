# require 'rails_helper'
#
# describe UsersController, type: :controller do
#   before do
#     @user = FactoryBot.create(:user)
#     @admin = FactoryBot.create(:user)
#   end
#
#   describe "GET #index" do
#     context "when a user is not logged in" do
#       it 'redirects to login' do
#         get :index
#         expect(response).to redirect_to(new_user_session_path)
#       end
#     end
#   end
#
#   describe "GET #show" do
#     context "when a user is logged in" do
#       before do
#         sign_in @user
#       end
#
#       it "loads correct user details" do
#         get :show, params: { id: @user.id }
#         expect(assigns(:user)).to eq @user
#         expect(response).to have_http_status(200)
#       end
#     end
#
#     context "when wrong user tries to access another user's details" do
#       before do
#         sign_in @admin
#       end
#
#       it "redirects to 'products-index' root page" do
#         get :show, params: { id: @user.id}
#         expect(response).to redirect_to(root_path)
#         expect(response).to have_http_status(302)
#       end
#     end
#
#     context "when a user is not logged in" do
#       it 'redirects to login' do
#         get :show, params: { id: @user.id }
#         expect(response).to redirect_to(new_user_session_path)
#       end
#     end
#
#     context "when an admin-user attempts to access another user's details" do
#       before do
#         sign_in @admin
#       end
#
#       it "loads other user's correct details" do
#         get :show, params: { id: @user.id }
#         expect(assigns(:user)).to eq @user
#         expect(response).to have_http_status(302)
#       end
#     end
#   end
# end
