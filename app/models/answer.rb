class Answer < ApplicationRecord
	belongs_to :user
	belongs_to :question

	validate_presence_of :name
end
