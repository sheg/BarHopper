require 'rails_helper'

RSpec.describe User, :type => :model do

  describe "authentication" do

    before { @user = User.new(email: "monkey@test.com", password: "asdqwe", password_confirmation: "asdqwe" ) }

    it "should properly authenticate with valid password" do
      expect(@user.authenticate(@user.password)).to eq @user
    end

    it "should not authenticate with invalid password" do
      expect(@user.authenticate("monkey password")).to be_falsey
    end
  end
end