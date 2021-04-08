class PostsController < ApplicationController
	before_action :get_posts, only: [:show, :edit, :update, :destroy]
	after_action :after_method, only: [:show]
	around_action :around_method, only: [:show]


    def index
  	   @posts = current_user.posts.short_content(7).search(params[:search])
  	   
  	   
    end


	def show
		puts '++++++++++++++++++++ inside show'
	end

	def new
		@post = Post.new

	end

	def create
		@post = current_user.posts.new(post_params)

		if @post.save
			PostMailer.on_create_mail(@post).deliver
			redirect_to posts_path
		else
			render :new
		end
	end

	def edit
			
	end

	def update

		if @post.update(post_params)
			PostMailer.on_update_mail(@post).deliver
			redirect_to @post
		else
			render :edit
		end
		
	end

	def destroy
		@post.destroy

		redirect_to posts_path
	end

	private
	def post_params
		params.require(:post).permit(:content)
	end

	def get_posts
		puts '++++++++++++++++++++ before show'
		@post = current_user.posts.find(params[:id])		
	end

	def after_method
		puts '++++++++++++++++++++ after show'
	end

	def around_method
		puts '++++++++++++++++++++ before around show'
		@abcd = 1

		yield

		@abcd += 1
		puts '++++++++++++++++++++ after around show'
	end


	 	
end
