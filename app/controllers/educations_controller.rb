class EducationsController < ApplicationController
  
  def new
    @education = Education.new
    # Used to fill hidden id for for association
    @current_user = current_user
    @current_user_id = @current_user.id
  end
  
  def create
    @education = Education.new(education_params)
    if @education.save
        flash[:success] = "Profile Created"
        redirect_to root_path
    else
        render action: :new
    end    
  end    

  def update
    @education = Education.find_by(user_id: params[:id])
    if @education.update_attributes(education_params)
      flash[:success] = "Artículo Revisado!"
      # Redirect to the education's profile
      redirect_to root_path
    else
      render action: :edit #Don't send, go back to edit action.
    end
  end  

  def destroy
    @education = Education.find(params[:id])
    @education.destroy
    flash.notice= "Artículo eliminado."
    redirect_to root_path
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
