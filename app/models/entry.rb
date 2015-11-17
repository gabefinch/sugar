class Entry < ActiveRecord::Base
  validates :value, numericality: true
  validates :value, presence: true
  validate :no_more_than_four_entries_per_day

  def no_more_than_four_entries_per_day
    if Entry.entries_today.length >= 4
      errors.add(:value, "exceeds the number of allowed entries (4/day)")
    end
  end

  def self.entries_today
    Entry.where("created_at >= ?", Time.zone.now.beginning_of_day)
  end

  def self.mean
    entry_matches = self.entries_today
    if entry_matches.length == 0
      return 0
    else
      sum = 0
      entry_matches.each do |entry|
        sum += entry.value
      end
      return sum / entry_matches.size
    end
  end

  def self.max
    entry_matches = self.entries_today
    if entry_matches.length == 0
      return 0
    else
      max = 0
      entry_matches.each do |entry|
        max = entry.value if entry.value > max
      end
      return max
    end
  end

  def self.min
    entry_matches = self.entries_today
    if entry_matches.length == 0
      return 0
    else
      min = entry_matches.first.value
      entry_matches.each do |entry|
        min = entry.value if entry.value < min
      end
      return min
    end
  end

end
