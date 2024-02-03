class ReviewsController < ApplicationController
  def new
    @family_member = FamilyMember.find(params[:family_member_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @family_member = FamilyMember.find(params[:family_member_id])
    @review.family_member = @family_member
    @review.user = current_user
    if @review.save
      redirect_to family_member_path(@family_member)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
