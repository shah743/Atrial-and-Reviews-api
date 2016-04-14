class ApplicationController < ActionController::API
  include CanCan::ControllerAdditions
  include ActionController::Serialization

end
