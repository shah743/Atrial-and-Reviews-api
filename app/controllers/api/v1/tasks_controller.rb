class Api::V1::TasksController < ApplicationController
  # before_action :set_task, only: [:show, :update, :destroy]
  load_and_authorize_resource

  # GET /tasks
  def index
    render json: @tasks
  end

  # GET /tasks/1
  def show
    render json: @task
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)

    if @task.save
      render json: @task, status: :created, location: api_v1_task_path(@task)
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      head :no_content
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
    head :no_content
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  # def set_task
  #   @task  = Task.find(params[:id])
  # end

  def task_params
    params.require(:task).permit(:title, :description)
  end
end