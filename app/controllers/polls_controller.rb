class PollsController < ApplicationController

	def new
		@poll = Poll.new
	end

	def create
		@poll_params = params[:poll]
		list = [('a'..'z'), ('A'..'Z'), (0..9)].map { |range| range.to_a }.flatten 
    admin = (0..5).map { list[Random.rand(list.length)] }.join
		@poll_params[:admin_link] = "http://localhost:3000/#{admin}"
		#test for uniqueness
		@poll_params[:link] = "http://localhost:3000/#{params[:poll][:name]}"
		@poll = Poll.new(@poll_params)

		if @poll.save
      flash[:notice] = "Poll created"
      flash[:color]= "valid"
   		redirect_to poll_path(@poll)
    else
      flash[:notice] = "There was a problem with your poll"
      flash[:color]= "invalid"
      redirect_to root_path
    end
	end

	def show
	# if user links from admin link:
	# display admin link and user link

	# options to edit, delete

	# form to create questions

	# and list of questions with edit and delete ability

	# if user links from user link:
	# list of questions

		@question = Question.new
		@questions = Question.find_all_by_poll_id(params[:id])
		@poll = Poll.find(params[:id])
	end

	def destroy
		@poll = Poll.find(params[:id])
		@poll.destroy
		redirect_to root_path  
	end

end
