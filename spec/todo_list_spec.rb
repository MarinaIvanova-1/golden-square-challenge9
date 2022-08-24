require 'todo_list'

RSpec.describe ToDoList do
  it "returns an empty list if there are no tasks" do
    my_list = ToDoList.new
    expect(my_list.all).to eq []
  end

  it "gives an error if there are no tasks in the list" do
    my_list = ToDoList.new
    expect{ my_list.completed }.to raise_error "You don't have any tasks in the list"
  end

end