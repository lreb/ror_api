class Api::V1::PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  # GET /post
  def index
    @post = Post.all
    render json: @post
  end

  # GET /post/1
  def show
    render json: @post
  end

  # POST /post
  def create
    puts post_params
    @post = Post.new(post_params)

    if @post.save
      render json: @post, status: :created# , location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /post/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:title, :body, :user_id)
    end

end
