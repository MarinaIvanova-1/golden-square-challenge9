require 'diary_entry'

RSpec.describe DiaryEntry do
  it "returns the contents of the diary entry" do
    entry_1 = DiaryEntry.new("contents1")
    expect(entry_1.read).to eq "contents1"
  end

  it "counts words in a diary entry" do
    entry_1 = DiaryEntry.new("one " * 20)
    expect(entry_1.count_words).to eq 20
  end 
end