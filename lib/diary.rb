class Diary
  def initialize
    @all_entries = []
  end

  def add(entry)
    @all_entries << entry
  end

  def all
    @all_entries
  end

  def count_words
    sum = 0
    @all_entries.each { |entry| sum += entry.count_words}
    return sum
  end

  def find_best(wpm, minutes)
    fail "You don't have any entries in the diary" if @all_entries.empty?
    read_words = wpm * minutes
    hash_of_entries = {}
    for entry in @all_entries
      hash_of_entries.store(entry, entry.count_words)
    end
    hash_of_entries.delete_if {|entry, length| length > read_words }
    return hash_of_entries.sort_by {|entry, length| length }.reverse.first[0...-1]
  end

  def phone_book
    @all_phone_numbers = []
    @all_entries.each { |entry| @all_phone_numbers << entry.phone_book unless entry.phone_book.empty?}
    @all_phone_numbers.uniq.join(', ')
  end
end