class TopicsController < ApplicationController

	def new
		@topic = Topic.new
	end

	def create
		if current_user.present?
			topic = Topic.new(topic_params)
			if topic.save
				redirect_to '/', notice: 'Topic created sucessfully'
			else
				redirect_to '/', notice: 'Topic not created'
			end
		else
			redirect_to '/', notice: 'You have to log in first'
			
		end
	end

	private
	def topic_params
		params.require(:topic).permit(:name)
	end


end
