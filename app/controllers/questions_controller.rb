class QuestionsController < ApplicationController
	def create
		poll = Poll.find_by_admin_link(params[:admin_link])
		@question = poll.questions.new(params[:question])
		if @question.save
      flash[:notice] = "Question created"
      flash[:color]= "valid"
      redirect_to admin_path(params[:admin_link])
    else
      flash[:notice] = "There was a problem with your poll"
      flash[:color]= "invalid"
    end
	end

	def destroy
		poll = Poll.find_by_admin_link(params[:poll_id])
		@question = poll.questions.find(params[:id])
		@question.destroy
		redirect_to admin_path(poll.admin_link)	
	end

	def edit
		@poll = Poll.find_by_admin_link(params[:poll_id])
		@question = @poll.questions.find(params[:id])
	end

	def index
		@poll = Poll.find_by_link(params[:title])
		@answer = Answer.new
	end

	def show
		@poll = Poll.find_by_admin_link(params[:poll_id])
		@question = @poll.questions.find(params[:id])
		@answers = Answer.find_all_by_question_id(params[:id])
	end

	def update
		@question = Question.find(params[:id])
		@question.question = params[:question][:question]
		if @question.save
      flash[:notice] = "Your question was updated"
      flash[:color]= "valid"
      redirect_to admin_path(params[:poll_id])
    else
      flash[:notice] = "There was a problem with your question"
      flash[:color]= "invalid"
    end
	end

end
