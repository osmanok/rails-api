class Api::V1::RelationshipsController < Api::V1::BaseController
  def create
    @other_user = User.find(params[:followed_id])
    @user.follow!(@other_user)

    render 'profiles/show'
  end

  def destroy
    @other_user = Relationship.find(params[:id]).followed
    @user.unfollow!(@other_user)

    render 'profiles/show'
  end
end
