class CollegesController < ApplicationController
	def create
		
		@college = current_user.colleges.new(college_params)
        redirect_to lectures_path , notice: @college.save ? 'College Name Successfully Written!' : 'Cannot save college'
        
	end

	def destroy

		
		@college = College.find(params[:id])
		@college.destroy
		respond_to do |format|
           format.html { redirect_to lectures_url, notice: "successfully destroyed." }
           format.json { head :no_content }		
	    
	    end
	end


  private
    def college_params
      params.require(:college).permit(:name, :lecture_id)
    end
  end

