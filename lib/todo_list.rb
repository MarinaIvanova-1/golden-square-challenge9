class ToDoList
  def initialize 
    @all_tasks = []
  end

  def add(todo) 
    @all_tasks << todo
  end

  def all 
    @all_tasks
  end

  def completed 
    fail "You don't have any tasks in the list" if @all_tasks == []
    list_of_completed = []
    @all_tasks.each {|entry| list_of_completed << entry if entry.complete?}
    list_of_completed
  end

  def not_completed 
    list_of_not_completed = []
    @all_tasks.each {|entry| list_of_not_completed << entry if entry.complete? == false}
    list_of_not_completed
  end
end