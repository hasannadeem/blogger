class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, except: [:index]
  before_action :set_comment, only: [:show, :edit, :update, :destroy, :report]

  # GET /comments
  def index
    @comments = @post.comments
    # @comments = Comment.includes(:post)
  end

  # GET /comments/1
  def show
  end

  # GET /comments/new
  def new
    @comment = @post.comments.new
    @comment.user_id = current_user.id
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  def create
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.js
        # format.html { redirect_to post_path(@post), notice: 'Comment was successfully created.' }
      end
    end
  end

  # PATCH/PUT /comments/1
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to post_path(@post), notice: 'Comment was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.js
    end
  end

  def report
    @report = @comment.reports.new
    @report.user_id = current_user.id

    respond_to do |format|
        if @report.save
          format.js
        end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = @post.comments.find(params[:id])
    end

    def set_post
      @post = Post.find(params[:post_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body)
    end
end