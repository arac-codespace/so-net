class SkillsController < ApplicationController
  
  def edit
    @skill = Skill.find_by(user_id: params[:id])
    @skill_array = @skill.skill_hash
    @skill_path = params[:path]
    
    
    
  end
  
  
  def update
    # Find the corresponding record id that you want to update!
    @skill = Skill.find(params[:id])
    
     respond_to do |format|
      if @skill.update(skill_params)
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @skill.errors.full_messages,
                                   status: :unprocessable_entity }
      end
     
    end
  end  
  
  private
  
  def skill_params
      # paras_allow = :user_id, skill_hash: [] 
      params.require(:skill).permit(:user_id, skill_hash: [])
  end
  
end
