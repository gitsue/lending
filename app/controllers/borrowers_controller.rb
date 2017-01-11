class BorrowersController < ApplicationController
  def index
  	#History.where(borrower_id:1).first.lender.fname
  	@borrower = Borrower.where(id: session[:curr_userid]).first
  	@lenders = History.where(borrower_id: session[:curr_userid])
  	@raised = @borrower.money
  	render "index"
  end


end
