namespace :data do
  desc "Fill database with 10 fake leagues"
  task populate_bars: :environment do
    3.times { FactoryGirl.create :bar }
  end
end