class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @family_members = @order.family_members
  end

  def new
    @family_member = FamilyMember.find(params[:family_member_id])
    @order = Order.new
    @order.family_member = @family_member
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    if @order.save
      redirect_to order_path(@order)
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:title, :description, :value_hour, :available_date)
  end
end
