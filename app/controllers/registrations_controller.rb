class RegistrationsController < Devise::RegistrationsController
    def create
      super do |resource|
        if resource.persisted?
          UserMailer.welcome_email(resource).deliver_now
        end
      end
    end

    def edit
        super
        # Additional logic specific to the edit action, if needed
      end
  end
  