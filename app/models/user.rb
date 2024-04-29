class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :posts
         has_many :people
         has_one_attached :avatar

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :caption, presence: true
  validates :avatar, presence: true
      PASSWORD_FORMAT = /\A
         (?=.{6,})          # Minimum 6 characters
         (?=.*[A-Z])        # At least one uppercase letter
         (?=.*[0-9])        # At least one digit
         (?=.*[@#])         # At least one special character (# or @)
       /x
     
       validates :password, presence: true, format: { with: PASSWORD_FORMAT, message: "must contain at least one capital letter, one number, one special character (@ or #), and be at least 6 characters long" }, on: :create
       validates :password, presence: true, confirmation: true, on: :update, allow_blank: true

       validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
       def reset_password_instructions
              @reset_password_url = edit_user_password_url(self, reset_password_token: reset_password_token)
              mail(to: email, subject: 'Reset Your Password')
            end
     
end
