require 'rails_helper'

module V1
  RSpec.describe BarsController, :type => :controller do

    let(:bar_size) { 2 }

    before do
      Bar.destroy_all
      bar_size.times { create(:bar) }
    end

    describe "Finding Bars" do
      context "Without Auth Token" do

        it "should not allow searching for bars" do
          response = get(:index)
          expect(response).to have_http_status :unauthorized
        end
      end

      context "With Auth Token" do
        it "should retrieve all bars" do
          user = FactoryGirl.create(:user)
          @request.env["HTTP_AUTHORIZATION"] = "Token token=#{user.auth_token}"

          response = get(:index)
          expect(JSON.parse(response.body).size).to be bar_size
        end
      end
    end
  end
end