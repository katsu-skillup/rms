class MembersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_member, only: [:show, :edit, :update, :destroy, :cheack_authority]
  before_action :cheack_authority, only: [:show, :edit, :update, :destroy] 

def index
  @members = current_user.members.order(valuation_id:"ASC").page(params[:page])
  if @members.count == 0
    redirect_to new_member_path
  end
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
  @meetings = @member.meetings.order(meeting_date:"DESC").page(params[:page]).per(3)
 end

 def edit
 end

def update
  if @member.update(member_params)
    redirect_to member_path(params[:id])
   else
     render :edit
   end
  end

def destroy
  @member.destroy
  redirect_to members_path
end

private

def member_params
  params.require(:member).permit(:image, :member_name, :organization, :position, :work_info, :valuation_id, :communication, :leadership, :skill, :motivation).merge(user_id: current_user.id)
end

def set_member
  @member = Member.find(params[:id])
end

def cheack_authority
  unless @member.user_id == current_user.id
    redirect_to root_path
  end
end


end
