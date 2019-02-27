class ReviewsController < ApplicationController
  before_action :find_restaurant, only: [:index, :new, :create]

  def index
  end

  # def new
  #   @review = Review.new
  # end

  def create
    review = Review.new(review_params)
    review.restaurant = @restaurant
    if review.save
      redirect_to restaurant_path(@restaurant)
    else
      redirect_to new_restaurant_review_path
    end
  end

  private

  def review_params
    params.require('review').permit([:content, :rating])
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
