class Api::V1::UsersController < ApplicationController
  # before_action :set_user, only: [:show, :update, :destroy]
  load_and_authorize_resource

  # GET /users
  def index
    if @current_user.admin?
      render json: @users
    else
      render json: @users, except: [:api_key]
    end
  end

  # GET /users/1
  def show
    if @current_user.admin? or @current_user == @user
      render json: @user
    else
      render json: @user, except: [:api_key]
    end
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: api_v1_user_path(@user)
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      head :no_content
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    head :no_content
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  # def set_user
  #   @user  = User.find(params[:id])
  # end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:name, :email, :role, :api_key)
  end
end