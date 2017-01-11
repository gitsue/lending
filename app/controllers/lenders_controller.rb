class LendersController < ApplicationController
  def index
  	#Borrower.all
  	#History.where(lender_id:Lender.first).first.borrower.fname
  	@lender = Lender.where(id: session[:curr_userid]).first
  	@borrowers = History.where(lender_id: @lender.id).group('borrower_id')
  	@borrower_sum = History.where(lender_id: @lender.id).group('borrower_id').sum(:amount)
  	@balance = @lender.money.to_i - @lender.moneylent.to_i
  	@people_in_need = Borrower.all
  	render "index"
  end
end
