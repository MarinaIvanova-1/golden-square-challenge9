class ToDo
  def initialize(task) 
    @finished = false
  end

  def mark_complete 
    @finished = true
  end

  def complete? 
    @finished
  end

end