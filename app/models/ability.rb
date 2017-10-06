class Ability
  include CanCan::Ability

  def initialize(user)
      user ||= User.new # guest user (not logged in)
       if user.admin?
         can :manage, Book
         can :manage, User
       else
         can :read, Book
       end
  end
end
