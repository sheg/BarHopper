namespace :data do
  desc "Fill database with 10 fake leagues"
  task populate_bars: :environment do
    3.times { FactoryGirl.create :league }
    3.times { FactoryGirl.create :partially_filled_league }
  end
end