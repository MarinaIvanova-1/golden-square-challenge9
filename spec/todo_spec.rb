require 'ToDo'

RSpec.describe ToDo do
  it "marks the tasks as complete" do
    my_task = ToDo.new("walk the dog")
    my_task.mark_complete 
    expect(my_task.complete?).to be_truthy
  end
end