class Question < ActiveRecord::Base
	belongs_to :user
	belongs_to :exam
	has_many :choice
end
