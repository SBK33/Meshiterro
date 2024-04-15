class ApplicationController < ActionController::Base

#↓deviseのメソッド
  before_action :authenticate_user!, except: [:top], unless: :admin_controller?
  before_action :cofigure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    post_images_path
  end
  #(resource)にはUser情報が格納される
  def after_sign_out_path_for(resource)
    about_path
  end
#↑deviseのメソッド
  private
 
  def admin_controller?
    self.class.module_parent_name == 'Admin'
  end
  
  protected

  def cofigure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end


end
