class FamilyMembersController < ApplicationController
  before_action :set_family_member, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @family_members = FamilyMember.all
    @orders = Order.all
  end

  def show
    @name = "#{@family_member[:first_name]} #{@family_member[:last_name]}"
    @reviews = Review.joins(:order).where(order: { family_member_id: @family_member.id })
    @user = current_user
  end

  def new
    @family_member = FamilyMember.new
  end

  def create
    @family_member = FamilyMember.new(family_member_params)
    @family_member.user = current_user
    if @family_member.save
      redirect_to family_member_path(@family_member)
    else
      render :new, status: :unprocessable_entity
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
    @user = current_user
    if @family_member.orders.any?
      flash[:alert] = "Você não pode deletar alguém que contenha pedidos em aberto."
      redirect_to user_path, status: :see_other
    else
      @family_member.destroy
      redirect_to family_members_path, status: :see_other
    end
  end

  private

  def set_family_member
    @family_member = FamilyMember.find(params[:id])
  end

  def family_member_params
    params.require(:family_member).permit(:first_name, :last_name, :kinship,
                                          :description, :profile_title, :value_hour, :photo)
  end
end
