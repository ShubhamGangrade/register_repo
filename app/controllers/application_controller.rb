class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
     before_action :configure_permitted_parameters, if: :devise_controller?


     protected

     def configure_permitted_parameters
         devise_parameter_sanitizer.permit :sign_in, keys: [:login, :password]
         added_attrs = [:username, :first_name, :last_name, :email, :password, :password_confirmation, :remember_me]
         edit_user = [:username, :first_name, :last_name, :email, :password, :password_confirmation, profile_attributes: [:id, :phone, :address, :school, :school_percentage, :graduation, :graduation_percentage]]
         devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
         devise_parameter_sanitizer.permit :account_update, keys: edit_user
     end

         def update_resource(resource, params)
         resource.update_without_password(params)
     end
 end