class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_current_user

  def after_sign_in_path_for(_resource)
    events_path
  end

  def after_sign_out_path_for(_resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    # binding.pry
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image, [child_attributes: %i[name user_id]]])
  end

  def set_current_user
    @set_current_user = User.find_by(id: session[:user_id])
  end
end
