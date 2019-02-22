class User::RegistrationsController < Devise::RegistrationsController

    private
        def after_sign_up_path_for(resource)
            user_path(resource)
        end

end