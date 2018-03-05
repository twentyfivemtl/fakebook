class PostsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  # # GET /posts
  # # GET /posts.json
  # def index
  #   @posts = Post.all
  #   respond_with(@posts)
  # end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @comments = @post.comments.all
  end

  # # GET /posts/new
  # def new
  #   @post = Post.new
  #   respond_with(@post)
  # end

  # # GET /posts/1/edit

  # POST /posts
  # POST /posts.json

  def create
    @post = Post.new(post_params) do |post|
      post.user = current_user
    end
    if @post.save
      redirect_to root_path
    else
      redirect_to root_path, notice: @post.errors.full_messages.first
    end
  end

  def edit
  end

  def update
    @post.update(post_params)
    respond_to @post
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to root_path }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:content, :attachment)
  end
end
