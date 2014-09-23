class AnswersController <ApplicationController
  before_action :authorize, only: [:new]
  def index
    @answers = Answer.all
  end

  def new
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new

  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    if @answer.save
      respond_to do |format|
        format.html { redirect_to question_path(@question), notice: 'success'}
        format.js
      end
    else
      render 'new'
    end
  end

private
  def answer_params
    params.require(:answer).permit(:question_id, :user_id, :answer).merge(:user_id => current_user.id, :question_id => @question.id)
  end

end
