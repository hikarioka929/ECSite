class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_out_path_for(resource)
        if resource == :admin
            new_admin_session_path
        else
            root_path
        end
    end

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name,:first_name,:kana_last_name,:kana_first_name,:phone_number,:post_code,:address])
        devise_parameter_sanitizer.permit(:account_update, keys: [:last_name,:first_name,:kana_last_name,:kana_first_name,:phone_number,:post_code,:address])
    end
end
