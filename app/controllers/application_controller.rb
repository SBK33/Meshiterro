class ApplicationController < ActionController::Base

#↓deviseのメソッド
  before_action :cofigure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    about_path
  end
  #(resource)にはUser情報が格納される
  def after_sign_out_path_for(resource)
    about_path
  end
#↑deviseのメソッド

  protected

  def cofigure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end


end
