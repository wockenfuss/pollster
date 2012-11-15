class PollsController < ApplicationController

	def new
		@poll = Poll.new
	end

	def create
		list = [('a'..'z'), ('A'..'Z'), (0..9)].map { |range| range.to_a }.flatten 
    admin = (0..5).map { list[Random.rand(list.length)] }.join
		#test for uniqueness
		link = params[:poll][:name].split(' ').join
		@poll = Poll.new(params[:poll])
		@poll.admin_link = admin
		@poll.link = link

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
		@poll = Poll.find_by_admin_link(params[:admin_link])
		@question = Question.new
	end

	def destroy
		@poll = Poll.find_by_admin_link(params[:id])
		@poll.destroy
		redirect_to root_path  
	end

end
