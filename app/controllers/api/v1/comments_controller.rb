class Api::V1::CommentsController < Api::V1::PostsController
  before_action :set_post, only: [:show, :create, :index, :approve, :deny]
  before_action :set_comment, only: [:show, :update]
  
  
  def show
  end

  def create
    @comment = @post.comments.build(comment_params)

    if @comment.save
      render :show, status: :created
    else
      render json: { message: @comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
    @comments = @post.comments
  end

  def approve
    @comment = Comment.find(params[:id])
    @comment.update(approved: true)
    render :show, status: :ok
  end

  def deny
    @comment = Comment.find(params[:id])
    @comment.update(approved: false)
    render :show, status: :ok
  end
  
  private

    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:title, :body).merge(user: @user)
    end
end
