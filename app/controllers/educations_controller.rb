class EducationsController < ApplicationController
  
  def new
    @education = Education.new
    # Used to fill hidden id for for association
    @current_user = current_user
    @current_user_id = @current_user.id
  end
  
  def edit
    @user = User.find(params[:id])
    # Ids the proper education record to create the form_for
    # Query string row_id is used for that purpose
    @education = Education.find(params[:row_id])
    
  end
  
  def create
    @education = Education.create(education_params)
 
    respond_to do |format|
      if @education.save
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @education.errors.full_messages, 
                            status: :unprocessable_entity }
      end
      
    end
  end  
  
  def update
    @education = Education.find_by(user_id: params[:id])
    
     respond_to do |format|
      if @education.update(education_params)
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @education.errors.full_messages,
                                   status: :unprocessable_entity }
      end
     
    end
  end  

  def destroy
    
    @education = Education.find(params[:id])

    @education.destroy
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
  
  def education_params
      paras_allow = :user_id, :school, :degree, :field, :start_date, :end_date, :grade, :description
      params.require(:education).permit(paras_allow)
  end    

end
