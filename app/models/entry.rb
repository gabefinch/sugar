class Entry < ActiveRecord::Base
  validates :value, numericality: true
  validates :value, presence: true
  validate :no_more_than_four_entries_per_day

  def no_more_than_four_entries_per_day
    if Entry.entries_today >= 4
      errors.add(:value, "exceeds the number of allowed entries (4/day)")
    end
  end

  def self.entries_today
    Entry.where("created_at >= ?", Time.zone.now.beginning_of_day).length
  end

end
