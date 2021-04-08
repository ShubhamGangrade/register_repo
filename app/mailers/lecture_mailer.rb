class LectureMailer < ApplicationMailer

	def on_create_lecture(lecture, current_user)
		@subject = lecture.subject
		@email = current_user.email 
		mail( 
            :to => @email, 
            :subject => 'Lecture Created'
        )
	end

	def on_update_lecture(lecture, current_user)
		@subject = lecture.subject
		@email = current_user.email 
        mail( 
            :to => @email, 
            :subject => 'lecture Updated'
        )
	end

	def on_comment_lecture(lecture, comment, current_user)
		@lecture_subject = lecture.subject
        @commenter = comment.commenter
        @body = comment.body
        @name = current_user.username
		@email = current_user.email
		mail(
			:to => @email,
			:subject => 'Comment Made on your Lecture')		
	end

end
