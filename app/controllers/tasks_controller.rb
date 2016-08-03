class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
  end

  def create
    # @task = Task.new(description: params[:description], completed: params[:completed])
    @task = Task.new(task_params)
    @task.completed = false if @task.completed.nil?
    @task.save

    redirect_to task_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    # redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    # redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:description, :completed)
  end
end
