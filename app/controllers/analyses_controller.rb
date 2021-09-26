class AnalysesController < ApplicationController
  before_action :authenticate_user!

  def index
    @members = current_user.members
    if @members.count == 0
       redirect_to root_path
    else 
      @chart = {"S" => @members.where(valuation_id: "2").count, "A" => @members.where(valuation_id: "3").count, "B" => @members.where(valuation_id: "4").count, "C" => @members.where(valuation_id: "5").count}
    end
  end
end
