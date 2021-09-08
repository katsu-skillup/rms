class MembersController < ApplicationController
  before_action :authenticate_user!

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
      redirect_to members_path
    else
      render :new
    end
end

 def show
 end

private

def member_params
  params.require(:member).permit(:image, :member_name, :organization, :position, :work_info, :valuation_id, :communication, :leadership, :skill, :motivation).merge(user_id: current_user.id)
end


end
