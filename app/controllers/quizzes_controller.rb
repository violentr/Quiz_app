class QuizzesController < ApplicationController

def index
	@quizzes =Quiz.all
end

def show
    @quiz = Quiz.find(params[:id])
    # redirect_to '/'
end

def new
	@quiz = Quiz.new
end

def create
	quiz = Quiz.create(params[:quiz].permit(:title))
	redirect_to quiz
end


end
