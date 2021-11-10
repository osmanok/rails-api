class Api::V1::PostsController < Api::V1::BaseController
  before_action :set_post, only: [:show, :update, :destroy] 
  before_action :authorize_post, only: [:update, :destroy]

  #GET /api/v1/posts
  def index
    @posts = @user.posts
    @user.requests.create(method: :get, requestable_type: "Post")
  end

  #GET /api/v1/posts/:id
  def show
    @user.requests.create(method: :get, requestable_type: "Post")
  end

  #POST /api/v1/posts
  def create
    @post = @user.posts.build(post_params)
    if @post.save
      render :show, status: :created
    else
      render json: { message: @post.errors.full_messages }, status: :unprocessable_entity
    end
    @user.requests.create(method: :post, requestable_type: "Post")
  end

  #PATCH/PUT /api/v1/posts/:id
  def update
    if @post.update(post_params)
      render :show, status: :ok
    else
      render json: { message: @post.errors.full_messages }, status: :unprocessable_entity
    end
    @user.requests.create(method: :put, requestable_type: "Post")
  end

  #DELETE /api/v1/posts/:id
  def destroy
    @post.destroy
    head :no_content, status: :ok
    @user.requests.create(method: :delete, requestable_type: "Post")
  end 
  
  private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :body, :visible, :vote)
    end

    def authorize_post
      render json: { message: "Unauthorized" }, status: :unauthorized unless @user == @post.user
    end
end
