# app/mailers/user_mailer.rb
class UserMailer < ApplicationMailer
    def welcome_email(user)
      @user = user
      mail(to: @user.email, subject: 'Welcome to Connectopia!')
    end
  
    def reset_password_instructions(user)
      @user = user
      @reset_password_url = edit_user_password_url(@user, reset_password_token: @user.reset_password_token)
      mail(to: @user.email, subject: 'Reset Your Password')
    end
end
  