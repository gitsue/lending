class BorrowersController < ApplicationController
  def index
  	#History.where(borrower_id:1).first.lender.fname
  	@borrower = Borrower.where(id: session[:curr_userid]).first
  	@lenders = Borrower.where(id: session[:curr_userid]).first.lenders_who_lended
  	@raised = @borrower.money
  	render "index"
  end


end
