class UsersController < ApplicationController
  def show
    @user = current_user
    @orders = current_user.orders
    @name = "#{current_user.first_name} #{current_user.last_name}"
    @family_member = FamilyMember.new
    @family_members = FamilyMember.where(user: current_user)
    @member_name = @family_members.map { |member| "#{member.first_name} #{member.last_name}" }
    @initials = "#{current_user.first_name[0]}#{current_user.last_name[0]}"
  end
end
