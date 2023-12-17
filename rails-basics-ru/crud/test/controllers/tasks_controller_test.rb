require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  def setup
    @task_attributes = {
      name: Faker::Name.name_with_middle,
      description: Faker::Lorem.question,
      status: 'new',
      creator: Faker::Name.name_with_middle,
      performer: Faker::Name.name_with_middle,
      completed: true
    }
    @task = Task.create(@task_attributes)
  end

  test 'should destroy task' do
    delete task_url(@task)

    assert_redirected_to tasks_url
  end
end
