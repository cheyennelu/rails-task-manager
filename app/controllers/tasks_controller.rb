class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    strong_params = params.require(:task).permit(:title, :details)
    @task = Task.new(strong_params)
    if @task.save
      redirect_to show_task_path(@task)
    else
      render :new
    end
  end
end
