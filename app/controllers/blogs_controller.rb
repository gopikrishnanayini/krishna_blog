class BlogsController < ApplicationController
	def index
		@blogs = Blog.all
	end
	def new
		@blog = Blog.new
	end
	def create
		@blog = Blog.new(blog_params)
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
	def show
		@blog = Blog.find(params[:id])
		@commentable = @blog
		@comments = @commentable.comments
		@comment = Comment.new
	end
	def edit
		@blog = Blog.find(params[:id])
	end
	def update
		@blog = Blog.find(params[:id])
		respond_to do |format|
			if @blog.update(blog_params)
				format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
				format.json { render json: show, status: :created, location: @blog }
			else
				format.html { render action: 'edit'}
				format.json { render json: @blog.errors, :status => :unprocessable_entity}
			end
		end
	end
	def destroy
		@blog = Blog.find(params[:id])
		@blog.destroy
		redirect_to blogs_path
	end
	private
	def blog_params
		params.require(:blog).permit(:title, :body)
	end

end
