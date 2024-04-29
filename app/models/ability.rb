class Ability
    include CanCan::Ability
  
    def initialize(user)
      user ||= User.new # Guest user (not logged in)
  
      if user.admin?
        can :manage, Person # Admin can manage all people
      else
        can [:read, :create], Person
        can [:update, :destroy], Person, user_id: user.id # Users can only update/delete their own people
      end
    end
  end
  