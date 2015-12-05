class AddUserIdToExamQuestionChoiceAnswer < ActiveRecord::Migration
	def change
		affected_tables = [:exams, :questions, :choices, :answers]

		affected_tables.each do |t|
			add_reference t, :user, index: true, foreign_key: true
		end
	end
end
