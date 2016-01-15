require 'rails_helper'

module V1
  RSpec.describe UsersController, :type => :controller do

    describe "Creating new users" do

      # it "should make a basic new user" do
      #   build_name = Time.now.to_s
      #
      #   post :create, :build => { :name => build_name, :environment_id => default_environment.id }
      #
      #   expect(response).to have_http_status 201
      #   expect(JSON.parse(response.body)['name']).to eq build_name
      # end
    end
  end
end