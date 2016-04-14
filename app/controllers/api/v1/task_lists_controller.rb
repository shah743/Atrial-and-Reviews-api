class Api::V1::TaskListsController < ApplicationController
  # before_action :set_task_list, only: [:show, :update, :destroy]
  load_and_authorize_resource :user
  load_and_authorize_resource through: :user

  # GET /task_lists
  def index
    render json: @task_lists
  end

  # GET /task_lists/1
  def show
    render json: @task_list
  end

  # POST /task_lists
  def create
    @task_list = TaskList.new(task_list_params)

    if @task_list.save
      render json: @task_list, status: :created, location: api_v1_task_list_path(@task_list)
    else
      render json: @task_list.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /task_lists/1
  def update
    if @task_list.update(task_list_params)
      head :no_content
      render json: @task_list
    else
      render json: @task_list.errors, status: :unprocessable_entity
    end
  end

  # DELETE /task_lists/1
  def destroy
    @task_list.destroy
    head :no_content
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  # def set_task_list
  #   @task_list  = TaskList.find(params[:id])
  # end

  def task_list_params
    params.require(:task_list).permit(:title)
  end
end