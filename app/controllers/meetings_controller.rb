class MeetingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_meeting, only: [:edit, :update, :destroy, :cheack_authority]
  before_action :cheack_authority, only: [:edit, :update, :destroy] 
  
  def new
    @member = Member.find(params[:member_id])
    if @member.user_id == current_user.id
       @meeting = Meeting.new
    else 
      redirect_to root_path
    end
  end

  def create
    @meeting = Meeting.new(meeting_params)
    if @meeting.save
      redirect_to member_path(params[:member_id])
    else
       render :new
    end
  end

  def edit
  end

  def update
   if @meeting.update(meeting_params)
      redirect_to member_path(params[:member_id])
   else
     render :edit
   end
  end

  def destroy
    @meeting.destroy
    redirect_to member_path(params[:member_id])
  end

private
  
  def meeting_params
    params.require(:meeting).permit(:meeting_date, :meeting_info).merge(member_id: params[:member_id] ,user_id: current_user.id)
  end

  def set_meeting
    @meeting = Meeting.find(params[:id])
  end

  def cheack_authority
    unless @meeting.user_id == current_user.id 
      redirect_to root_path
    end
  end

end
