class TopicFollower < ApplicationRecord
	belongs_to :user
	belongs_to :topic

	validates :topic, uniqueness: {scope: :user, message: "Already Following"}
end
