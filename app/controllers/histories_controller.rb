class HistoriesController < ApplicationController
  def addlender
  	@lender = Lender.where(id: session[:curr_userid]).first
  	@history = History.create(lender_id: @lender.id, borrower_id: params[:id], amount: params[:moneylent])
  	redirect_to "/online_lending/lender/#{@lender.id}"
  end
end
