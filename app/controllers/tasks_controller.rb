class TasksController < ApplicationController

  before_action :identify_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(strong_params)
    if @task.save
      redirect_to task_path(@task)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(strong_params)
      redirect_to task_path(@task)
    else
      render :edit
    end
  end

  def destroy
    if @task.destroy
      redirect_to tasks_path
    end
  end

private

  def identify_task
    @task = Task.find(params[:id])
  end

  def strong_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
