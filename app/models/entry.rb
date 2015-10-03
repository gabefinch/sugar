class Entry < ActiveRecord::Base
  validates :value, numericality: true
  validates :value, presence: true
end
