class HistoriesController < ApplicationController
  def addlender
  	@lender = Lender.where(id: session[:curr_userid]).first
    @borrower = Borrower.where(id: params[:id]).first
  	if @lender.money.to_i >= params[:moneylent].to_i 
      @history = History.create(lender_id: @lender.id, borrower_id: params[:id], amount: params[:moneylent])
      @lender_balance = @lender.money.to_i - params[:moneylent].to_i
      @lender.update(money: @lender_balance)
      
      @borrower_raised = @borrower.raised.to_i + params[:moneylent].to_i
      Borrower.where(id: params[:id]).first.update(raised: @borrower_raised) 
      redirect_to "/online_lending/lender/#{@lender.id}"
    else
      flash[:money_error] = "Insufficient funds to lend!"
      redirect_to "/online_lending/lender/#{@lender.id}"
    end

    # if @borrower.raised.to_i <= params[:moneylent].to_i
    #   @history = History.create(lender_id: @lender.id, borrower_id: params[:id], amount: params[:moneylent])
    #   @lender_balance = @lender.money.to_i - params[:moneylent].to_i
    #   Lender.where(id: session[:curr_userid]).first.update(money: @lender_balance)
    #   @borrower_raised = @borrower.raised.to_i + params[:moneylent].to_i
    #   Borrower.where(id: params[:id]).first.update(raised: @borrower_raised) 
    #   redirect_to "/online_lending/lender/#{@lender.id}"      
    # else
    #   flash[:money_error2] = "Borrower has raised enough funds!"
    #   redirect_to "/online_lending/lender#{@lender.id}"
    # end
  end
end
