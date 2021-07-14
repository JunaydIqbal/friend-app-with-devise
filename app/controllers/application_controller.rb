# class ApplicationController < ActionController::Base
# end


class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password)}
        #devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :password, :password_confirmation])
        devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:login, :password, :password_confirmation)}
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password, :current_password)}
    end

    # def authenticate_user_new!
    #   if user_signed_in?
    #     super
    #   else
    #     redirect_to new_user_session_path, :notice => 'Login again!'
    #   end
    # end

end

# class ApplicationController < ActionController::Base
#   before_action :configure_permitted_parameters, if: :devise_controller?

#   protected

#   def configure_permitted_parameters
#     added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
#     devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
#     devise_parameter_sanitizer.permit :sign_in, keys: [:login, :password]
#     devise_parameter_sanitizer.permit :account_update, keys: added_attrs
#   end
# end