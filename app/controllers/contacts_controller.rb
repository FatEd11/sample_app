class ContactsController < ApplicationController
	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(params[:contact])
		@contact.request = request
		if @contact.deliver
			flash[:success] = "Your message has been succesfully sent. I'll be reading it shortly..probably"
			redirect_to '/'
		else
			render 'new'
		end
	end
end