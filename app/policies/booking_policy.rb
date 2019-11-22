class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def show?
    return true
  end

  def update?
    #record.animal.user == user
    true
  end

  def edit?
    true
  end

  def destroy?
    record.user == user || record.animal.user == user
  end
end
