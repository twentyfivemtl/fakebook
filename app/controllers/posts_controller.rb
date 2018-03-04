class PostsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_post, only: [:show, :update, :destroy]
  # # GET /posts
  # # GET /posts.json
  # def index
  #   @posts = Post.all
  #   respond_with(@posts)
  # end

  respond_with :html

  # GET /posts/1
  # GET /posts/1.json
  def show
    respond_with(@post)
  end

  # # GET /posts/new
  # def new
  #   @post = Post.new
  #   respond_with(@post)
  # end

  # # GET /posts/1/edit
  # def edit
  # end

  # POST /posts
  # POST /posts.json

  def create
    @post = Post.new(post_params) do |post|
      post.user = current_user
    end
    if @post.save
      redirect_to root_path
    else
      redicted_to root_path, notice: @post.errors.full_messages.first
    end
  end
  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    @post.update(post_params)
    respond_with(@post)
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_with(@post)
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
