class Bar < ActiveRecord::Base

  has_many :tabs
  has_many :users, through: :tabs

  validates_presence_of :name

end