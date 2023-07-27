class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  # This is a helper method that can be used in any controller
  # to add a server timing header to the response.
  def add_server_timing_header(name, duration)
    # If the header already exists, append the new timing to the existing header.
    if response.headers['Server-Timing'].present?
      response.headers['Server-Timing'] += ", #{name};dur=#{duration}"
    else
      response.headers['Server-Timing'] = "#{name};dur=#{duration}"
    end
  end

  protected

  def after_sign_in_path_for(_resource)
    home_index_path
  end

  def after_sign_out_path_for(_resource_or_scope)
    new_user_session_path
  end

  def after_inactive_sign_up_path_for(_resource)
    new_user_session_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password password_confirmation])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[name email password password_confirmation current_password])
  end
end
