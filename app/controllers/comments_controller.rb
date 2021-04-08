class CommentsController < ApplicationController
 def create
 	
 	@commentable = if params[:lecture_id]
 		Lecture.find(params[:lecture_id])
 	elsif params[:post_id]
 		Post.find(params[:post_id])
 	end
 			
    @comment = @commentable.comments.new(comment_params)
    @comment.save

    if params[:post_id]
    	PostMailer.on_comment_mail(@commentable, @comment).deliver
    end

    if params[:lecture_id]
    	LectureMailer.on_comment_lecture(@commentable, @comment, current_user).deliver
    end

    redirect_to @commentable

 end

 private
 def comment_params
 	  params.require(:comment).permit(:commenter, :body)
 end

end