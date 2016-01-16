require 'rails_helper'

RSpec.describe User, :type => :model do

  before { User.destroy_all }

  let(:user) { build(:user) }

  describe "authentication" do
    it "should properly authenticate with valid password" do
      user.save
      expect(user.authenticate(user.password)).to eq user
    end

    it "should not authenticate with invalid password" do
      user.save
      expect(user.authenticate("monkey password")).to be_falsey
    end

    it "should set an auth token upon creation" do
      expect(user.auth_token).to be_nil
      user.save
      expect(user.auth_token).to_not be_nil
    end
  end

  describe "Email Validations" do
    it "should not allow duplicate emails" do
      user_copy = user.dup
      user.save
      expect(user_copy.save).to be_falsey
    end

    it "should not allow missing emails" do
      user = build(:user, email: nil)
      user.save
      expect(user.save).to be_falsey
    end

    it "should not allow empty emails" do
      user = build(:user, email: '')
      user.save
      expect(user.save).to be_falsey
    end

    it "should allow valid email format" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        user.email = valid_address
        user.save
        expect(user).to be_truthy
      end
    end

    it "should not allow invalid email formats" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                   foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        user.email = invalid_address
        user.save
        expect(user).to be_falsy
      end
    end
  end
end