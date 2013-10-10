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

describe '/quizzes/new' do 
	it 'creates a new quiz with question' do 
		visit '/quizzes/new'

		fill_in 'Title', with: 'Brand new quiz'
		fill_in 'Question', with: 'Question'
		click_button "Create Quiz"
	
		
	expect(page).to have_content 'Brand new quiz'
	#expect(page).to have_content 'Question'
end 

end


describe '/quizzes/edit' do
it 'should edit existing quizz' do
	visit('/quizzes/1/edit')
	exiting_title = Quiz.find(1).title
	fill_in 'Title' , with: 'New Title which should be the same'
	click_button 'Update'
	expect(Quiz.find(1).title).not_to eq exiting_title
end

end
end