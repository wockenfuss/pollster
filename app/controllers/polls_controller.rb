class PollsController < ApplicationController

	def new
		@poll = Poll.new
	end

	def create
		list = [('a'..'z'), ('A'..'Z'), (0..9)].map { |range| range.to_a }.flatten 
    admin = (0..5).map { list[Random.rand(list.length)] }.join
		#test for uniqueness
		@poll = Poll.new(params[:poll])
		@poll.admin_link = admin

		if @poll.save
      flash[:notice] = "Poll created"
      flash[:color]= "valid"
   		redirect_to admin_path(@poll.admin_link)
    else
    	puts @poll.errors
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
		@poll = Poll.find_by_admin_link(params[:admin_link])
		@question = Question.new
	end

	def destroy
		@poll = Poll.find(params[:id])
		@poll.destroy
		redirect_to root_path  
	end

end
