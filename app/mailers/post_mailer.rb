class PostMailer < ApplicationMailer

	def on_create_mail(post)
		@title = post.content
		@email = post.user.email 
		
        mail( 
            :to => @email, 
            :subject => 'Post Created'
        )
	end

	def on_update_mail(post)
		@title = post.content
		@email = post.user.email
        mail( 
            :to => @email, 
            :subject => 'Post Updated'
        )
	end


	def on_comment_mail(post, comment)
		@post_content = post.content
	    @commenter = comment.commenter
		@body = comment.body
		@email = post.user.email 
        mail( 
            :to => @email, 
            :subject => 'Comment Made on your Post'
        )
	end


end
