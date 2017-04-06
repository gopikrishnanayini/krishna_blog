class BlogsController < ApplicationController
	def new
		@blog = Blog.new
	end
	def create
		@blog = Blog.new(params[:blog])
	    respond_to do |format|
	    	if @blog.save
	    		format.html { redirect_to @blog, notice: 'Blog was successfully created.'}
	    		format.json { render json: show, :status => :created, location: @blog}
	    	else
	    		format.html { render action: 'new'}
	    		format.json { render json: @blog.errors, :status => :unprocessable_entity}
	    	end
	    end
	end
end
