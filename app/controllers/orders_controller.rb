class OrdersController < ApplicationController


  def index
    @orders = Order.all
    @user_orders = current_user.orders
  end

  def show
    @order = Order.find(params[:id])
    @family_members = @order.family_member

  end

  def new
    @family_member = FamilyMember.find(params[:family_member_id])
    @order = Order.new
    @order.family_member = @family_member
  end

  def create
    @order = Order.new(quantity_hour: order_params[:quantity_hour], family_member_id: params[:family_member_id])
    @order.user = current_user
    if @order.save
      redirect_to order_path(@order)
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:quantity_hour, :family_member_id, :user_id)
  end
end
