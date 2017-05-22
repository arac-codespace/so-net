class WorksController < ApplicationController
  
  def new
    @work = Work.new
    # Used to fill hidden id for for association
    @current_user = current_user
    @current_user_id = @current_user.id
  end
  
  def edit
    # Ids the proper work record to create the form_for
    # Query string row_id is used for that purpose
    @work = Work.find(params[:row_id])
    
  end
  
  def create
    @work = Work.create(work_params)
 
    respond_to do |format|
      if @work.save
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @work.errors.full_messages, 
                            status: :unprocessable_entity }
      end
      
    end
  end  
  
  def update
    # Find the corresponding record id that you want to update!
    @work = Work.find(params[:id])
    
     respond_to do |format|
      if @work.update(work_params)
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @work.errors.full_messages,
                                   status: :unprocessable_entity }
      end
     
    end
  end  

  def destroy
    # Find the corresponding record id that you want to destroy!
    @work = Work.find(params[:id])

    @work.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
  
  def index
  end
  
  def show
  end

  private
  
  def work_params
      paras_allow = :user_id, :company, :industry, :job_title, :start_date, :end_date, :description
      params.require(:work).permit(paras_allow)
  end
end
