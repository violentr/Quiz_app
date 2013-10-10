class Question < ActiveRecord::Base
	has_many :answers
	belongs_to :quiz
	accepts_nested_attributes_for :answers
	def correct_answer
		answers.find_by_correctness(true)
	end
end
