class LendersController < ApplicationController
  def index
  	#Borrower.all
  	#History.where(lender_id:Lender.first).first.borrower.fname
  	@lender = Lender.where(id: session[:curr_userid]).first
  	@borrowers = History.where(lender_id: @lender.id)
  	@balance = @lender.money.to_i - @lender.moneylent.to_i
  	@people_in_need = Borrower.where(raised: "")
  	render "index"
  end
end
