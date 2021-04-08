class HomeController < ApplicationController
before_action :configure_account_update_params, only: [:edit, :update]


	def index
		@children = current_user.children
	end

  protected

  def configure_account_update_params
  	
    devise_parameter_sanitizer.permit(:account_update, except: [:current_password, :password])
  end


end
