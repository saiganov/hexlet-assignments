# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show; end

  def new
    @task = Task.new
  end

  def edit; end

  def create
    @task = Task.create(task_params)

    redirect_to @task if @task.save
    render :new
  end

  def update
    redirect_to task_path(@task) if @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    redirect_to tasks_path if @task.destroy
    redirect_to task_path(@task)
  end

  private

  def task_params
    params.required(:task).permit(%i[name description status creator performer completed])
  end

  before_action do
    @task = Task.find(params[:id]) if params[:id]
  end
end
