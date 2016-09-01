class PagesController < ApplicationController
  before_action :last_comments

  def show
    render "pages/#{params[:page]}"
  end
end
