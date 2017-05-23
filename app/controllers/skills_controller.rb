class SkillsController < ApplicationController
  
  def index
    @skill = Skill.find(15)
  end
  
  def new
    @skill = Skill.new
  end
  
  def edit
    @skill = Skill.find(params[:id])
    @skill_array = @skill.skill_hash
    
    
    
  end
  
  def create
    @skill = Skill.new(skill_params)
    if @skill.save
        flash[:success] = "Profile Updated"
        redirect_to root_path
    else
        render action: :new
    end    
  end 
  
  def update
    @skill = Skill.find(params[:id])
  
      if @skill.update(skill_params)
        redirect_to root_path
      else
        render action :edit
      end
  end
  
  private
  
  def skill_params
      # paras_allow = :user_id, skill_hash: [] 
      params.require(:skill).permit(:user_id, skill_hash: [])
  end
  
end
