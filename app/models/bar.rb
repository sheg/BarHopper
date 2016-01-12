class Bar < ActiveRecord::Base

  validate :name, presence: true

end
