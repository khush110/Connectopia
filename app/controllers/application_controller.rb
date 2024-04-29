class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :username, :avatar, :caption])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :username, :avatar, :caption])
    end

    private 

    def search_people(query)
        query = query.to_s.downcase # Convert query to string and downcase it
        if current_user.admin?
          Person.where("LOWER(first_name) LIKE ? OR LOWER(last_name) LIKE ?", "%#{query}%", "%#{query}%")
        else
          current_user.people.where("LOWER(first_name) LIKE ? OR LOWER(last_name) LIKE ?", "%#{query}%", "%#{query}%")
        end
    end
      

end
