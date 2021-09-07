class MembersController < ApplicationController

def index
  members = Member.all
  @members = current_user.members.order(valuation_id:"ASC")
end

def new
  @member = Member.new
end

def create
  @member = Member.new(member_params)
    if @member.save
      redirect_to root_path
    else
      render :new
    end
end

private

def member_params
  params.require(:member).permit(:image, :member_name, :organization, :position, :work_info, :valuation_id, :communication, :leadership, :skill, :motivation).merge(user_id: current_user.id)
end


end
