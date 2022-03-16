class FriendshipsController < ApplicationController
  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user.id)
    redirect_to user_path(@user)
  end

  def destroy
    current_user.unfollow(params[:id])
    redirect_to user_path(params[:id])
  end
end
