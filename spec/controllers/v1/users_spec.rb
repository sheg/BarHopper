require 'rails_helper'

module V1
  RSpec.describe UsersController, :type => :controller do

    describe "Creating new users" do

      let(:user) { build(:user) }

      context "required fields" do
        it "should create a new user" do
          body = { user: {
              email: user.email, first_name: user.first_name,
              last_name: user.last_name, address: user.address,
              city: user.city, state: user.state, zip: user.zip,
              password: user.password, password_confirmation: user.password_confirmation
          }}

          post(:create, body)

          expect(response).to have_http_status 201
          expect(JSON.parse(response.body)['email']).to eq user.email
        end

        it "should not allow blank emails" do
          body = { user: {
              email: '', first_name: user.first_name,
              last_name: user.last_name, address: user.address,
              city: user.city, state: user.state, zip: user.zip,
              password: user.password, password_confirmation: user.password_confirmation
          }}

          post(:create, body)

          expect(response).to have_http_status 422
          expect(response.body).to eq %Q{{"email":["can't be blank","is invalid"]}}
        end
      end
    end
  end
end