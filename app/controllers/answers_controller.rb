class AnswersController < ApplicationController
  def create
    question = Question.find(params[:question_id])
    answer = question.answers.new(answers_params.merge(user_id: current_user.id))
    if answer.save
      redirect_to question_path(question), notice: 'Answer created sucessfully'
    else
      redirect_to question_path(question), notice: 'Answer not created'
    end
  end

  private
  def answers_params
    params.require(:answer).permit(:name)
  end
end
