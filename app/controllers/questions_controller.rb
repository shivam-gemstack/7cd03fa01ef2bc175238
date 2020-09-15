class QuestionsController < ApplicationController

	def index 
		if current_user.present?
			@questions = current_user.questions 
		else
			notice = "you have to log_in first"
		end
	end

	def new
		@question = Question.new
	end

	def create
		if current_user.present?
			question = current_user.questions.new(question_params)
			if question.save
				redirect_to question_path(question), notice: 'Question created sucessfully'
			else
				redirect_to '/', notice: 'Question not created'
			end
		else
			redirect_to '/', notice: 'you have to log_in first'
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
