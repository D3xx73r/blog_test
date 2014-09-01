require 'rails_helper'

RSpec.describe Admins::UsersController, :type => :controller do
  let(:admin) { FactoryGirl.create(:admin) }

  before(:each) do
    sign_in(admin)
  end

  after(:each) do
    sign_out(admin)
  end

  describe "#index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end
  
  describe "#new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "#create" do
    it "redirects to root path" do
      sign_in(admin)

      post :create, user: { email: Faker::Internet.email, password: "supersecret", password_confirmation: "supersecret" }
      expect(response).to redirect_to(root_path)
    end
  end

  context "when creating an invalid user" do
    it "renders the new template" do
      @user = User.new

      post :create, user: { email: "", password: "supersecret", password_confirmation: "supersecret" }
      expect(response).to render_template(:new)
      expect(flash[:alert]).to eq("Hubo un problema al crear el Usuario: #{@user.email}.")
    end
  end
end
