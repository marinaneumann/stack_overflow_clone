class AnswersController <ApplicationController
  def index
    @answers = Answer.all
  end

  def new
    @answer = Answer.new
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.find(params[:id])
    @answer = Answer.create(answer_params)
    if @answer.save
      flash[:notice]="Answer added"
      redirect_to question_path
    else
      render 'new'
    end
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to question_path
  end

private
  def answer_params
    params.require(:answer).permit(:question_id, :user_id).merge(:user_id => current_user.id, :question_id => @question.id)
  end

end
