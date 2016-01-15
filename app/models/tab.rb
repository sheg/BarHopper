class Tab < ActiveRecord::Base

  belongs_to :user
  belongs_to :bar

  validates_numericality_of :balance
end