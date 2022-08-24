require 'diary'
require 'diary_entry'
require 'todo'
require 'todo_list'

RSpec.describe "integration" do
  context "when we have many entries in the diary" do 
    it "add diary entries to the list and returns the list of all diary entries" do
      my_diary = Diary.new
      entry_1 = DiaryEntry.new("contents-1")
      entry_2 = DiaryEntry.new("contents-2")
      my_diary.add(entry_1)
      my_diary.add(entry_2)
      expect(my_diary.all).to eq [entry_1, entry_2]
    end

    it "counts words in all entries combined" do
      my_diary = Diary.new
      entry_1 = DiaryEntry.new("one " * 10)
      entry_2 = DiaryEntry.new("two " * 20)
      my_diary.add(entry_1)
      my_diary.add(entry_2)
      expect(my_diary.count_words).to eq 30
    end

    it "returns the longest entry that one can read in the given amount of time" do
      my_diary = Diary.new
      entry_1 = DiaryEntry.new("one " * 10)
      entry_2 = DiaryEntry.new("two " * 20)
      my_diary.add(entry_1)
      my_diary.add(entry_2)
      expect(my_diary.find_best(3, 5)).to eq [entry_1]
    end

    it "finds all phone numbers in diary entries and returns only unique ones as a string" do
      my_diary = Diary.new
      entry_1 = DiaryEntry.new("Mark's phone number is 0123456789")
      entry_2 = DiaryEntry.new("two " * 20)
      entry_3 = DiaryEntry.new("Tom's phone number is 9876543210")
      entry_4 = DiaryEntry.new("Tom's phone number is 9876543210")
      my_diary.add(entry_1)
      my_diary.add(entry_2)
      my_diary.add(entry_3)
      my_diary.add(entry_4)
      expect(my_diary.phone_book).to eq "0123456789, 9876543210"
    end
  end


  context "when there are many tasks in the todolist" do
    it "adds the tasks to the todo list" do
      my_list = ToDoList.new
      task_1 = ToDo.new("Walk the dog")
      task_2 = ToDo.new("Do laundry")
      my_list.add(task_1)
      my_list.add(task_2)
      expect(my_list.all).to eq [task_1, task_2]
    end

    it "can can show only completed tasks" do
      my_list = ToDoList.new
      task_1 = ToDo.new("Walk the dog")
      task_2 = ToDo.new("Do laundry")
      my_list.add(task_1)
      my_list.add(task_2)
      task_2.mark_complete
      expect(my_list.completed).to eq [task_2]
    end

    it "can show onlky not completed tasks" do
      my_list = ToDoList.new
      task_1 = ToDo.new("Walk the dog")
      task_2 = ToDo.new("Do laundry")
      my_list.add(task_1)
      my_list.add(task_2)
      task_2.mark_complete
      expect(my_list.not_completed).to eq [task_1]
    end
  end
end