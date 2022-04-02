# frozen_string_literal: true

class Reports::CommentsController < ApplicationController
  def create
    @commentable = Report.find(params[:report_id])
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    @comment.save!
    redirect_to @commentable, notice: t('controllers.common.notice_create', name: Comment.model_name.human)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
