class Question < ApplicationRecord
	belongs_to :user
	belongs_to :topic
	has_many :answers, dependent: :destroy

	validates_presence_of :name
end
