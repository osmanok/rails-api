class Api::V1::DashboardController < Api::V1::BaseController
  def index
    @posts = @user.posts.recent
    @comments_approved =
     Comment
        .where("post_id IN (?)", @user.posts.ids)
        .approved_commments?
        .recent
    @comments_unapproved =
      Comment
        .where("post_id IN (?)", @user.posts.ids)
        .unapproved_commments?
        .recent

    render json: {
      posts: @posts,
      comments_unapproved: @comments_unapproved,
      comments_approved: @comments_approved
    }
  end
end
