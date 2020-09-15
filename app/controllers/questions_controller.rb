class QuestionsController < ApplicationController

	def index 
		@questions = current_user.questions
	end

	def new
		@question = Question.new
	end

	def create
		question = current_user.questions.new(question_params)
		if question.save
			redirect_to question_path(question), notice: 'Question created sucessfully'
		else
			redirect_to '/', notice: 'Question not created'
		end
	end


	def show
		@question = Question.find(params[:id])
		@answers = @question.answers
	end


	private
	def question_params
		params.require(:question).permit(:name,:topic_id)
	end


end
