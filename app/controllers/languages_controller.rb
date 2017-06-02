class LanguagesController < ApplicationController
  def new
    @language = Language.new
    # Used to fill hidden id for for association
    @current_user = current_user
    @current_user_id = @current_user.id
  end
  
  def edit
    # Ids the proper language record to create the form_for
    # Query string row_id is used for that purpose
    @language = Language.find(params[:row_id])
    
  end
  
  def create
    @language = Language.create(language_params)
 
    respond_to do |format|
      if @language.save
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @language.errors.full_messages, 
                            status: :unprocessable_entity }
      end
      
    end
  end  
  
  def update
    # Find the corresponding record id that you want to update!
    @language = Language.find(params[:id])
    
     respond_to do |format|
      if @language.update(language_params)
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @language.errors.full_messages,
                                   status: :unprocessable_entity }
      end
     
    end
  end  

  def destroy
    # Find the corresponding record id that you want to destroy!
    @language = Language.find(params[:id])

    @language.destroy
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
  
  def language_params
      paras_allow = :user_id, :language_name
      params.require(:language).permit(paras_allow)
  end  
end
