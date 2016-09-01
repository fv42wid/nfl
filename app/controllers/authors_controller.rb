class AuthorsController < ApplicationController
  before_action :last_comments
  
  def index
    @authors = Author.all
  end
end
