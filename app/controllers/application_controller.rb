class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :except => [:index, :show]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :bio, :avatar])
  end
end
