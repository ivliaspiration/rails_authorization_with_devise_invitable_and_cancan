class ApplicationController < ActionController::Base
  protect_from_forgery
  
  protected
  
  def authenticate_inviter!
    redirect_to root_url if !current_user.admin?
  end
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert  => exception.message
  end
end
