namespace :data do
  desc "create 1 user and send him to 3 bars"
  task generate_tabs: :environment do
    bar_hopper = FactoryGirl.create(:user)

    3.times do
      bar = FactoryGirl.create :bar
      Tab.create(user_id: bar_hopper.id, bar_id: bar.id, balance: rand(5.01...76.99).round(2) )
    end
  end
end