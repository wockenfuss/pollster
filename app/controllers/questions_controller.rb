class QuestionsController < ApplicationController
	def create
		poll = Poll.find_by_admin_link(params[:admin_link])
		@question = poll.questions.new(params[:question])
		if @question.save
      flash[:notice] = "Question created"
      flash[:color]= "valid"
      redirect_to admin_path(params[:admin_link])
			#redirect_to root_path#params[:admin_link]
    else
      flash[:notice] = "There was a problem with your poll"
      flash[:color]= "invalid"
    end
	end

	def destroy
		poll = Poll.find(params[:poll_id])
		@question = Question.find(params[:id])
		@question.destroy
		redirect_to admin_path(poll.admin_link)	
	end

	def edit
		#@question = Question.find(params[:id])
	end

end
