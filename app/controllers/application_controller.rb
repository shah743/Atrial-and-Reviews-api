class ApplicationController < ActionController::API
  include CanCan::ControllerAdditions
  include ActionController::Serialization

  before_action :authenticate_with_token!

  def current_user
    @current_user ||= if request.headers[:authorization].present?
                        User.find_by_api_key(request.headers[:authorization])
                      else
                        User.new
                      end
  end

  # Authenticate the user with token based authentication
  def authenticate_with_token!
    render json: { errors: "Not authenticated" }, status: :unauthorized unless current_user.present?
  end

  rescue_from CanCan::AccessDenied do |exception|
    render json: {errors: exception.message}.to_json, status: 403
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: {errors: e.message}.to_json, status: 404
  end
end
