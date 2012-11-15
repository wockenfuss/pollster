class AnswersController < ApplicationController

	def create
		question = Question.find(params[:answer][:question_id])
		#@poll = Poll.find(question.poll_id)
		answer = Answer.new(params[:answer])
		if answer.save
			flash[:notice] = "Your answer was recorded."
			redirect_to question_index_path(question.poll.link)
		else
			flash[:notice] = "There was a problem with your answer."
		end
	end



end
