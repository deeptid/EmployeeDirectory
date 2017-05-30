class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :ensure_success

  def ensure_success
    	if session[:is_db_initialized] == nil
         session[:is_db_initialized] = true  
         Thread.start {Employee.init_employee_db}
      end
  end
end
