# {{PROBLEM}} Multi-Class Planned Design Recipe

## 1. Describe the Problem

As a user
So that I can record my experiences
I want to keep a regular diary

As a user
So that I can reflect on my experiences
I want to read my past diary entries

As a user
So that I can reflect on my experiences in my busy day
I want to select diary entries to read based on how much time I have and my reading speed

As a user
So that I can keep track of my tasks
I want to keep a todo list along with my diary

As a user
So that I can keep track of my contacts
I want to see a list of all of the mobile phone numbers in all my diary entries


## 2. Design the Class System

diary - has diary entries
diary entries - read, select based on time and reading speed
todo list
tasks - keep track
contacts (phone numbers) - keep track 

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```
┌──────────────────┐                                      ┌────────────────────────┐
│  Diary entry     │                                      │  Phone book            │
│                  │                                      │                        │
│                  │                                      │  Scan all entries and  │
│                  │                                      │  saves phone numbers   │
│                  │                                      └────────────────────────┘
└─────────┬────────┘  ┌─────────────────────────────┐         ▲
          │           │                             │         │
          │           │         Diary               │         │
          └───────────►   Adds entries              ├─────────┘
                      │   Read entries              │
                      │   Select the best entry     │
                      └─────────────────────────────┘





                       ┌──────────────────────────────┐
┌──────────────┐       │                              │
│ ToDo task    │       │    Todo list                 │
│ Mark         ├───────►                              │
│ completed    │       │    add todo tasks            │
└──────────────┘       │    list all                  │
                       │    list completed            │
                       │    list the ones that        │
                       │    still need to be completed│
                       └──────────────────────────────┘
```

_Also design the interface of each class in more detail._

```ruby
class Diary
  def initialize
    # ...
  end

  def add(entry) # entry is an instance of DiaryEntry
    # Entry gets added to the Diary
    # Returns nothing
  end

  def all
    # Returns a list of all entries
  end
  
  def find_best(wpm, minutes) # wpm (words per minute) and minutes are integers
    # Returns the longest entry that can be read in the given time
  end

  def phone_book
    #returns all phone numbers from all entries as a string
  end
end

class DiaryEntry
  def initialize(contents) # contents is a string
  end

  def read
    # Returns a string with contents of a particular entry
  end
end


class ToDo
  def initialize(task) #task is a string
  end

  def mark_complete #marks the task as complete, returns nothing
  end

  def complete? #returns a boolean - complete or not complete
  end

end

class ToDoList
  def initialize 
  end

  def add(todo) #todo is an instance of ToDo, 
    # adds todo to a list of tasks, returns nothing
  end

  def all #returns the list of all tasks in the database
  end

  def completed #returns the list of all completed tasks
  end

  def not_completed #returns the list of all tasks that need to be completed 
  end
end
```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby

my_diary = Diary.new
entry_1 = DiaryEntry.new("contents-1")
entry_2 = DiaryEntry.new("contents-2")
my_diary.add(entry_1)
my_diary.add(entry_2)
my_diary.all # => [entry_1, entry_2]


my_diary = Diary.new
entry_1 = DiaryEntry.new("one" * 10)
entry_2 = DiaryEntry.new("two" * 20)
my_diary.add(entry_1)
my_diary.add(entry_2)
my_diary.find_best(3, 5) # => [entry_1]

my_diary = Diary.new
entry_1 = DiaryEntry.new("0123456789")
entry_2 = DiaryEntry.new("two" * 20)
entry_3 = DiaryEntry.new("9876543210")
my_diary.add(entry_1)
my_diary.add(entry_2)
my_diary.phone_book # => ["0123456789, 987654321"]

my_list = ToDoList.new
task_1 = ToDo.new("Walk the dog")
task_2 = ToDo.new("Do laundry")
my_list.add(task_1)
my_list.add(task_2)
my_list.all # => [task_1, task_2]

my_list = ToDoList.new
task_1 = ToDo.new("Walk the dog")
task_2 = ToDo.new("Do laundry")
my_list.add(task_1)
my_list.add(task_2)
my_list.not_completed # => [task_1, task_2]

my_list = ToDoList.new
task_1 = ToDo.new("Walk the dog")
task_2 = ToDo.new("Do laundry")
my_list.add(task_1)
my_list.add(task_2)
task_2.mark_complete
my_list.not_completed # => [task_1]
my_list.completed # => [task_2]

```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# EXAMPLE

# Constructs a track
track = Track.new("Carte Blanche", "Veracocha")
track.title # => "Carte Blanche"
```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._
