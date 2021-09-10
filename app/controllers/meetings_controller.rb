class MeetingsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @meeting = Meeting.new
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
    @meeting = Meeting.find(params[:id])
  end

  def update
    @meeting = Meeting.find(params[:id])
   if @meeting.update(meeting_params)
      redirect_to member_path(params[:member_id])
   else
     render :edit
   end
  end

  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.destroy
    redirect_to member_path(params[:member_id])
  end

private
  
  def meeting_params
    params.require(:meeting).permit(:meeting_date, :meeting_info).merge(member_id: params[:member_id] ,user_id: current_user.id)
  end

end
