class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # layout :layout

  # private

  # def layout
  #   if devise_controller? && devise_mapping.name == :admin
  #     "admin"
  #   else
  #     "application"
  #   end
  # end
  
  protected

  def configure_permitted_parameters
  	attributes = [:name, image_attributes: [:id, :avatar]]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes) 
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end
end