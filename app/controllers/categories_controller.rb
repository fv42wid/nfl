class CategoriesController < ApplicationController
  before_action :set_category

  def show
    @stories = @category.stories
    @subscriber = Subscriber.new
    @categories = Category.all
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:id)
    end
end
