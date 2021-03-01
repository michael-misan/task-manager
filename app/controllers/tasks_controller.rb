class TasksController < ApplicationController
  before_action :find_task, only: [:edit, :show, :destroy, :update]
  before_action :task, only: [:new, :create]

  def index
    @tasks = Task.order(created_at: :desc)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  def create
    if @task.update(task_params)
      redirect_to tasks_path
    else
      redirect_to new_tasks_path(@task)
    end
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path
    else
      redirect_to edit_tasks_path(@task)
    end
  end

  def edit
  end

  def show
  end

  def new
  end

  private

  def find_task
    @task ||= Task.find(params[:id])
  end

  def task
    @task ||= Task.new
  end

  def task_params
    params.require(:task).permit(:title, :description)
  end
end
