class Ability
  include CanCan::Ability

  def initialize(user)
     if user.permisos==1
         can :manage, :all
     else
        can :read, Contact
     end
  end
end
