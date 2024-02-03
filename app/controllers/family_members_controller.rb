class FamilyMembersController < ApplicationController
  before_action :set_family_member, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @family_members = FamilyMember.all
  end

  def show
    @name = "#{@family_member[:first_name]} #{@family_member[:last_name]}"
  end

  def new
    @family_member = FamilyMember.new
  end

  def create
    @family_member = FamilyMember.new(family_member_params)
    if @family_member.save
      redirect_to family_member_path(@family_member)
    else
      render :new, status: :unprocessable_entit
    end
  end

  def edit
  end

  def update
    if @family_member.update(family_member_params)
      redirect_to family_member_path(@family_member)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @family_member.destroy
    redirect_to family_members_path, status: :see_other
  end

  private

  def set_family_member
    @family_member = FamilyMember.find(params[:id])
  end

  def family_member_params
    params.require(:family_member).permit(:first_name, :last_name, :kinship,
                                          :description, :profile_title, :value_hour, :available_date)
  end
end
