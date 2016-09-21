class TasksController < ApplicationController
  before_filter :require_normal_user
  before_filter :set_user, only: [:index, :new, :create, :show]

  def index
    @tasks = @user.tasks
  end

  def new
    @task ||= Task.new
  	render
  end

  def create
    @task = @user.tasks.new task_params
    if @task.save
      redirect_to tasks_path, notice: "Task successfully created!"
    else
      render 'new'
    end
  end

  def show
    @task = @user.tasks.find(params[:id])
  end

  private

    def set_user
      @user = current_user
    end

    def task_params
      params.require(:task).permit(:user_id, :title, :description, :status)
    end
end
