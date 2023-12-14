class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show; end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)

    if @task.save
      redirect_to @task, notice: 'Task created.'
    else
      flash[:failure] = "Rrrors: #{@task.errors.full_messages.join(', ')}"

      render :new
    end
  end

  def edit; end

  def update
    if @task.update(task_params)
      flash[:success] = 'Task updated'

      redirect_to task_path(@task)
    else
      flash[:failure] = "Errors: #{@task.errors.full_messages.join(', ')}"

      redirect_to task_path(@task)
    end
  end

  def destroy
    if @task.destroy
      flash[:success] = 'Task deleted'

      redirect_to tasks_path
    else
      flash[:failure] = 'Task cannot be deleted'

      redirect_to task_path(@task)
    end
  end

  private

  def task_params
    params.required(:task).permit(%i[name description status creator performer completed])
  end

  before_action do
    @task = Task.find(params[:id]) if params[:id]
  end
end
