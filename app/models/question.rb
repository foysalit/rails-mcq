class Question < ActiveRecord::Base
	belongs_to :exam
	has_many :choice
end
