class QuestionsController < ApplicationController
	def create
		question_params = params[:question]
		question_params[:poll_id] = params[:poll_id]
		@question = Question.new(question_params)
		if @question.save
      flash[:notice] = "Question created"
      flash[:color]= "valid"
   		redirect_to poll_path(params[:poll_id])
    else
      flash[:notice] = "There was a problem with your poll"
      flash[:color]= "invalid"
    end
	end

	# def new
	# 	#@question = Question.new
	# end

	def destroy
		@question = Question.find(params[:id])
		@question.destroy
		redirect_to poll_path(params[:poll_id])
	end

	def edit
		#@question = Question.find(params[:id])
	end

end
