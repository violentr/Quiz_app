require 'spec_helper'

def create_quiz(some_title)
  Quiz.create({:title => some_title})
end

describe 'quizzes page' do
	it 'should display quizzes' do
		visit('/quizzes')
		expect(page).to have_content 'some quiz title'
	end
end

describe 'the quizzes section' do 
	before(:all) do
		create_quiz 'Some quiz'
	end 
	describe '/quizzes' do 
		it 'should display quizzes' do
		visit '/quizzes'
		expect(page).to have_content 'Some quiz'
	end 
end

describe '/quizzes/:id' do
	it 'has its own page' do
		visit "/quizzes"
		click_link 'Some quiz', :match => :first
		expect(page).to have_css 'h1', text: 'Some quiz'
	end 
end 

describe '/quizzes/new' do 
	it 'creates a new quiz' do 
		visit '/quizzes/new'

		within '.new_quiz' do 
			fill_in 'Title', with: 'Brand new quiz'
			click_button "Create Quiz"
		end 

		expect(current_url).to eq url_for(Quiz.last)
		expect(page).to have_content 'Brand new quiz'
	end 
end 




end