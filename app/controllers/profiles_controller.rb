class ProfilesController < ApplicationController
  
  def show
    @user = current_user
    @user_info = UserInfo.find_by(user_id: params[:id])
    @education = Education.find_by(user_id: params[:id])

  end
  
  def new
    @user_info = UserInfo.new
    @current_user = current_user
    @current_user_id = @current_user.id
  end
  
  def create
    @user_info = UserInfo.new(user_info_params)
    if @user_info.save
        flash[:success] = "Profile Updated"
        redirect_to root_path
    else
        render action: :new
    end    
  end  

  def edit
    @user_info = UserInfo.find_by(user_id: params[:id])
    @user = current_user
    # @user_id = params[:id]
    
  end
  
  def update
    @user_info = UserInfo.find_by(user_id: params[:id])
    if @user_info.update_attributes(user_info_params)
      flash[:success] = "Artículo Revisado!"
      # Redirect to the user_info's profile
      redirect_to root_path
    else
      render action: :edit #Don't send, go back to edit action.
    end
  end
  
  def destroy
    @user_info = UserInfo.find(params[:id])
    @user_info.destroy
    flash.notice= "Artículo eliminado."
    redirect_to root_path
  end  
  
  private
  
  def user_info_params
      paras_allow = :first_name, :last_name, :country, :state, :summary, :phone, :user_id, :headline, :school, :degree, :field, :start_date, :end_date, :grade, :description
      params.require(:user_info).permit(paras_allow)
  end    
  
end
