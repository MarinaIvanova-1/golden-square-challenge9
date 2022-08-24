require 'diary'

RSpec.describe Diary do
  it "returns and empty list if there are no diary entries" do
    my_diary = Diary.new
    expect(my_diary.all).to eq []
  end

  it "gives an error if there are no tasks in the list" do
    my_diary = Diary.new
    expect{ my_diary.find_best(5,20) }.to raise_error "You don't have any entries in the diary"
  end
end