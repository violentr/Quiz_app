class AddQuizIdToQuestions < ActiveRecord::Migration
  def change
    add_reference :questions, :quiz, index: true
  end
end
