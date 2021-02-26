class BookPolicy < ApplicationPolicy
  def show?
    record.published? || is_owner?
  end

  def update?
    is_owner?
  end

  def destroy?
    is_owner?
  end

  def create?
    user.present?
  end

  def new?
    user.present?
  end
end
