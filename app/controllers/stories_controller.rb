class StoriesController < ApplicationController
  before_action :set_story, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_author!, only: [:new, :create]
  before_action :last_comments

  # GET /stories
  # GET /stories.json
  def index
    @last_story = Story.last
    last_array = Array.new
    last_array.push(@last_story)
    @stories = Story.last(12).reverse - last_array
    @subscriber = Subscriber.new
    @categories = Category.all
  end

  # GET /stories/1
  # GET /stories/1.json
  def show
    @subscriber = Subscriber.new
    @categories = Category.all
    @comment = Comment.new
  end

  # GET /stories/new
  def new
    if current_author.profile == nil
      redirect_to stories_path, notice: 'Create a profile before submitting a story'
      
    end
    @story = Story.new
    @categories = Category.all
  end

  # GET /stories/1/edit
  def edit
    @categories = Category.all
  end

  # POST /stories
  # POST /stories.json
  def create
    @story = current_author.stories.new(story_params)
    @story.save
    @story.save_image(params[:story][:image])

    respond_to do |format|
      if @story.save
        format.html { redirect_to stories_path, notice: 'Story was successfully created.' }
        format.json { render :show, status: :created, location: @story }
      else
        format.html { render :new }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stories/1
  # PATCH/PUT /stories/1.json
  def update
    respond_to do |format|
      if @story.update(story_params)
        format.html { redirect_to @story, notice: 'Story was successfully updated.' }
        format.json { render :show, status: :ok, location: @story }
      else
        format.html { render :edit }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stories/1
  # DELETE /stories/1.json
  def destroy
    @story.destroy
    respond_to do |format|
      format.html { redirect_to stories_url, notice: 'Story was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_story
      @story = Story.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def story_params
      params.require(:story).permit(:title, :body, :author_id, :image, :category_id)
    end
end
