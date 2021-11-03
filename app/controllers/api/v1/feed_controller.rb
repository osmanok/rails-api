class Api::V1::FeedController < Api::V1::BaseController
  def index
    @feed = @user.feed
    render json: @feed
  end
end
