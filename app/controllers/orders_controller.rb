class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: %i[show destroy]

  def index
    @orders = Order.all
    @user_orders = current_user.orders
  end

  def show
    @user = current_user
    @order_review = @user.orders.find(params[:id]).review
    @family_members = @order.family_member
  end

  def new
    @family_member = FamilyMember.find(params[:family_member_id])
    @order = Order.new
    @order.family_member = @family_member
  end

  def create
    @order = Order.new(rent_date: order_params["rent_date"],
                       quantity_hour: order_params[:quantity_hour],
                       family_member_id: params[:family_member_id])
    date = Date.new(order_params["rent_date(1i)"].to_i,
                    order_params["rent_date(2i)"].to_i,
                    order_params["rent_date(3i)"].to_i)
    @order.rent_date = date
    @order.user = current_user

    if Order.where(rent_date: date, family_member_id: params[:family_member_id]).empty? && @order.save
      redirect_to order_path(@order)
    else
      flash[:alert] = "This family member is already booked for this date"
      render :new
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_path
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:quantity_hour, :family_member_id, :user_id, :rent_date)
  end
end
