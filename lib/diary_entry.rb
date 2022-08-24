class DiaryEntry
  def initialize(contents)
    @contents = contents
  end

  def read
    @contents
  end

  def count_words
    return @contents.split(" ").length
  end

  def phone_book
    @contents.scan(/\d{10}/).join(", ")
  end

end
