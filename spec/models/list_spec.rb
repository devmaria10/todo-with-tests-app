require 'rails_helper'

RSpec.describe List, type: :model do
  describe '#complete_all_tasks!' do
    it 'should mark all tasks from the list as complete' do
      list = List.create(name: "Groceries")
      task_1 = Task.create(complete: false, list_id: list.id, name: "Sour Cream")
      task_2 = Task.create(complete: false, list_id: list.id, name: "Sour Milk") 

      list.complete_all_tasks!

      list.tasks.each do |task|
        expect(task.complete).to eq(true)
      end 

    end 
  end 

  describe '#snooze_all_tasks!' do
    it 'should mark deadline for all tasks from the list to 1 hour from now' do 
      deadline = Time.now
      list = List.create(name: "Hair Chores")
      task_1 = Task.create(complete:false, list_id: list.id, name: "Brush my hair", deadline: Time.now)
      task_2 = Task.create(complete:false, list_id: list.id, name: "Braid my hair", deadline: Time.now)

      list.snooze_all_tasks!

      list.tasks.each do |task|
        expect(task.deadline).to eq(deadline: deadline + 1.hour)
      end 
    end 
  end 

  describe '#total_duration' do 
    it 'should return the total duration in minutes of all of the tasks' do 
      list = List.create(name: "Addl Hair Chores")
      task_1 = Task.create(complete: false, list_id: list.id, name: "Cut my hair", duration: 60)
      task_2 = Task.create(complete: false, list_id: list.id, name: "Shave my head", duration: 13)

      list.total_duration
      expect(list.total_duration).to eq(73)
    end 
  end 


  describe '#incomplete_tasks' do
    it 'should return a list of incomplete tasks' do 
      list = List.create(name: "Things to Buy")
      task_1 = Task.create(complete: false, list_id: list.id, name: "Shoes")
      task_2 = Task.create(complete: true, list_id: list.id, name: "Projector")

      list.incomplete_tasks

      expect(list.incomplete_tasks).to include(task_1)
    end 
  end

end 

  describe '#favorite_tasks'
    it 'should return a list of favorite tasks' do 
      list = List.create(name: "Favorite Tasks")
      task_1 = Task.create(complete: false, list_id: list.id, name: "Eat a mango", favorite: true)
      task_2 = Task.create(complete:true, list_id: list.id, name: "Take a nap", favorite: true)
      list.favorite_tasks
      expect(task.favorite_tasks).to eq(array_of_tasks)
    end 
  end 
end 
