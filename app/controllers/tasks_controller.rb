class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def destroy
    Task.find(params[:id]).destroy
    redirect_to tasks_path
  end
end
