class Color < ApplicationRecord
  validates :hex, presence: true
  validates_uniqueness_of :hex, message: 'Color has already been taken'
end
