class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def last_comments
    @last_comments = Comment.last(3)
    @last4_stories = Story.last(4)
  end
end
