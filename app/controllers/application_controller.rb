class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    attributes = [:email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: attributes
    devise_parameter_sanitizer.permit :account_update, keys: attributes
  end

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
  end

end
