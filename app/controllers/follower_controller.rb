class FollowerController < ApplicationController
	before_action :find_user, only: :follow_user
	before_action :find_topic_id, only: :follow_topic

	def follow_user
		if current_user.present?
			unless validate_following_user?
				follower = @user.user_followers.create(follower_id: current_user.id)
				notice = follower.errors.present? ? follower.errors.full_messages.join(', ') : 'Followed sucessfully'
			else
				notice = 'Can not follow your self'
			end
		else
			notice = "you have to log_in first"
		end
		redirect_to '/', notice: notice
	end

	def follow_topic
		follower = current_user.topic_followers.create(topic_id: @topic_id) if current_user.present?
		notice = "you have to log_in first"
		notice = follower.errors.present? ? follower.errors.full_messages.join(', ') : 'Topic followed sucessfully' if follower.present?
		redirect_to '/', notice: notice
	end

	private
	
	def find_user
		@user = Question.find(params[:id]).user
	end

	def find_topic_id
		@topic_id = Question.find(params[:id]).topic_id
	end

	def validate_following_user?
		current_user.id == @user.id
	end
end