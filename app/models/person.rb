class Person < ApplicationRecord
    has_one_attached :profile_picture
    belongs_to :user
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true
    validates :phone, presence: true
    validates :first_name, length: {minimum: 2, maximum: 10}
    validates :last_name, length: {minimum: 2, maximum: 10}
    validates :phone, length: {is: 10}

end
