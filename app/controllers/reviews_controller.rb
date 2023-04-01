class ReviewsController < ApplicationController

  def create
    @list = List.find(params[:id])
    @review = Review.new(review_params)
    @review.list = @list
    if @review.save
      redirect_to list_path(@list)
    else
      render "lists/show", status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to list_path(@review.list), status: :see_other
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
