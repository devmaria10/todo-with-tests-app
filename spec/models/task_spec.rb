require 'rails_helper'

RSpec.describe Task, type: :model do
  describe '#toggle_complete!' do
    it 'should change complete to true if complete is false' do
      task = Task.new(complete: false)
      task.toggle_complete!
      expect(task.complete).to eq(true)
    end 

    it 'should change complete to false if complete is true' do
      task = Task.new(complete: true)
      task.toggle_complete!
      expect(task.complete).to eq(false)
    end 

  end 

  describe '#toggle_favorite' do
    it 'should change favorite to true if favorite is false' do 
      task = Task.new(favorite: false)
      task.toggle_favorite!
      expect(task.favorite).to eq(true)
    end

    it 'should change favorite to false if favorite is true' do 
      task = Task.new(favorite:true)
      task.toggle_favorite!
      expect(task.favorite).to eq(false)
    end 
  end 

  describe '#overdue?' do
    it 'should change deadline to overdue if Time.now > deadline' do 
      task = Task.new(deadline: 1.hour.ago)
      expect(task.overdue?).to eq(true)
    end 

    it 'should return false if the deadline of task is in the future' do 
      task = Task.new(deadline: 1.hour.from_now)
      expect(task.overdue?).to eq(false)
    end 
  end 

  describe '#increment_priority!' do
    it 'should increase priority by one' do
      task = Task.new(priority: 5)
      task.increment_priority!
      expect(task.priority).to eq(6)
    end 

    it 'should not increment priority beyond 10'
      task = Task.new(priority: 10)
      task.increment_priority!
      expect(task.priority).to eq(10)
    end 
  end 

  describe '#decrement_priority!' do
    it 'should decrease priority by one' do
      task = Task.new(priority: 2)
      task.decrement_priority!
      expect(task.priority).to eq(1)
    end 

    it 'should not decrement priority by one under 1' do 
      task = Task.new(priority: 1)
      task.decrement_priority!
      expect(task.priority).to eq(1)
    end 
  end 

  describe '#snooze_hour!' do
    it 'should update deadline to snooze for 1 hour' do
      deadline = Time.now
      task = Task.new(deadline: deadline)
      task.snooze_hour!
      expect(task.deadline).to eq(deadline: deadline + 1.hour)
    end 
  end 
