class QuestionsController < ApplicationController
  before_action :require_login, only: [:new, :create, :upvote]

  def index
    @questions = Question.all.order(upvotes: :desc)
  end

  def show
    @question = Question.find(params[:id])
    @comment = Comment.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.build(question_params.merge(upvotes: 0))
    if @question.save
      redirect_to @question, notice: 'Question posted!'
    else
      render :new
    end
  end

  def upvote
    @question = Question.find(params[:id])
    @question.increment!(:upvotes)
    redirect_to @question
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end
end
