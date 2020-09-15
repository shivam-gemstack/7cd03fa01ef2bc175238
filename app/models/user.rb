class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :questions, dependent: :destroy
	has_many :answers, dependent: :destroy
	has_many :user_followers
	has_many :following, through: :user_followers, source: :follower

	has_many :topic_followers
	has_many :topics, through: :topic_followers

end
