class ReviewsController < ApplicationController
  before_action :set_order, only: [:new, :create]
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)    
    @review.user = current_user
    @review.order_id = @order.id
    if @review.save
      redirect_to orders_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_order
    @order = Order.find(params[:order_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
