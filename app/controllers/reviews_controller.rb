class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    # need both these @vars in case we need to render the form again.
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@review.restaurant.id)
    else
      render 'restaurants/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :restaurant_id)
  end
end
