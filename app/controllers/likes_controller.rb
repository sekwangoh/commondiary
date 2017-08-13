class LikesController < ApplicationController
  before_action :authenticate_user!

  def like_post_toggle
        @like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
        if @like.nil?
            Like.create(user_id: current_user.id, post_id: params[:post_id], comment_id: nil)
        else
            @like.destroy
        end
        redirect_to :back
    end
    def like_comment_toggle
        @like = Like.find_by(user_id: current_user.id, comment_id: params[:comment_id], post_id: params[:post_id])
        if @like.nil?
            Like.create(user_id: current_user.id, comment_id: params[:comment_id], post_id: params[:post_id])
        else
            @like.destroy
        end
        redirect_to :back
    end
end
