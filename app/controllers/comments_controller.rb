class CommentsController < ApplicationController
  before_action :require_login

  def create
    @question = Question.find(params[:question_id])
    @comment = @question.comments.build(comment_params.merge(user: current_user))
    if @comment.save
      redirect_to question_path(@question), notice: 'Comment added!'
    else
      redirect_to question_path(@question), alert: 'Comment failed.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
