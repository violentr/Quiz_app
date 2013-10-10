require 'spec_helper'

describe Question do
  it { should belong_to(:quiz) }
  it { should have_many(:answers) }

  it 'knows the correct answer' do
    question = Question.create(query: 'Where do babanas come from')
    correct = Answer.create(response: 'Banana Trees', correctness: true)
    wrong = Answer.create(response: 'Monkey corn fields', correctness: false)
    question.answers << correct
    question.answers << wrong

    expect(question.correct_answer).to eq correct
  end
end