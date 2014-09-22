class QuestionsController <ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if@question.save
      flash[:notice]="Question created"
      redirect_to questions_path
    else
      render 'new'
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash[:notice]= "Question Destroyed"
    redirect_to questions_path(current_user)
  end

private
  def question_params
    params.require(:question).permit(:question, :user_id).merge(:user_id => current_user.id)
  end
end
