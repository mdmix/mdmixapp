require 'rails_helper'

describe ProductsController, type: :controller do
  before do
    @user = FactoryBot.create(:user)
    @admin = FactoryBot.create(:admin)
    @product1 = FactoryBot.create(:product)
  end
  # let(:productX) { Product.create!(name: "Othello", description: "Good stuff", image_url: "Touch-of-evil.jpeg", price: 25.0) }
  # let(:userY) { User.create!(email: "youpi@netscape.net", password: "youpiyoupi", admin: true) }

  describe "GET #index" do
    context "when any user goes to products' index-page" do

      it "loads 'index' page fully and correctly" do
        get :index
        expect(response).to be_ok
        expect(response).to render_template('index')
      end

    end
  end

  describe "GET #show" do
    context "when any user goes to specific product page" do

      it "loads 'show' page correctly – with or without comments-related abilities" do
        get :show, params: {id: @product1.id}
        expect(assigns(:product)).to eq @product1
        expect(response).to be_ok
        expect(response).to render_template('show')
      end

    end
  end

  describe "POST #create" do
    context "when admin-user creates a new product page" do

      before do
        sign_in @admin
        # @product1 = FactoryBot.create(product)
      end

      it "loads new product's 'show' page" do
        # @product1 = @admin.create(:product)
        post :create, params: { product: {name: "Touch of Evil", description: "Good stuff", image_url: "Touch-of-evil.jpeg", color: "b/w", price: 59.0 } }
        # @product1 = FactoryBot.create(:product)
        # @product2 = Product.create!(name: "Othello", description: "Good stuff", image_url: "Touch-of-evil.jpeg", price: 25.0)
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(Product.last)
        expect(response).to redirect_to('/products/2')
      end

    end
  end

  describe "PATCH #update" do
    context "when admin-user updates a product" do

      before do
        sign_in @admin
      end

      it "loads 'landing-page'" do
        patch :update, params: { id: @product1, product: {name: "Test", description: "test", image_url: "Touch-of-evil.jpeg", color: "b/w", price: 25.0} }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(simple_pages_landing_page_path)
      end

    end
  end

  describe "DELETE #destroy" do
    context "when admin-user destroys a product" do

        before do
          sign_in @admin
        end

        it "deletes product and loads products' index page" do
          delete :destroy, params: {id: @product1.id}
          expect(response).to redirect_to(products_url)
          expect(response). to have_http_status(302)
        end

    end
  end


end
