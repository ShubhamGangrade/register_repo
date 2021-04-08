class RegistrationsController < Devise::RegistrationsController

  before_action :configure_account_update_params, only: [:edit, :update]

  def edit
    @users = User.all
    if !resource.profile
      resource.build_profile.educations.build
    elsif !resource.profile.educations
      resource.profile.educations.build
    end
  end

  protected

  def update_resource(resource, account_update_params)
    resource.update_without_password(account_update_params)
  end

  def after_update_path_for(resource)
  	
    #redirect_to [current_account, resource]
    root_path
  end

  def configure_account_update_params
  	
    devise_parameter_sanitizer.permit(:account_update, except: [:current_password, :password])
  end

  def account_update_params
    params.require(:user).permit(
      :parent_id, :username, :first_name, :last_name, :email, 
      :active, :password, :password_confirmation, 
      profile_attributes: [:id, :phone, :address,:country, 
        educations_attributes: [:id, :qualification, :board, :percentage, :year], 
        pet:[],  
      ]
    )
  end

end