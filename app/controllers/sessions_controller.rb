class SessionsController < ApplicationController
  def index
  	render "index"
  end
  def lender_register
  	@lender = Lender.create(lender_params)
  	puts lender_params
  	if @lender.valid?
  		session[:curr_userid] = @lender.id
  		redirect_to "/online_lending/lender/#{@lender.id}"
  	else
  		flash[:lender_errors] = @lender.errors.full_messages
  		redirect_to "/online_lending/register/"
  	end
  end

  def borrower_register
  	@borrower = Borrower.new(borrower_params)
  	if @borrower.save
  		session[:curr_userid] = @borrower.id
  		redirect_to "/online_lending/borrower/#{@borrower.id}/"
  	else
  		flash[:borrower_errors] = @borrower.errors.full_messages
  		redirect_to "/online_lending/register/"
  	end
  end

  def login_page
  	render "login"
  end

  def login
  	@lender = Lender.where(email: params[:email]).first
  	@borrower = Borrower.where(email: params[:email]).first
  	if @lender && @lender.authenticate(params[:password])
  		session[:curr_userid] = @lender.id
  		redirect_to "/online_lending/lender/#{@lender.id}/"
  	elsif  @borrower && @borrower.authenticate(params[:password])
  		session[:curr_userid] = @borrower.id
  		redirect_to "/online_lending/borrower/#{@borrower.id}/"
  	else
  		flash[:notice] = ["Login Credentials invalid!"]
  		redirect_to "/online_lending/login/"
  	end
  end

  def logout
  	reset_session
  	redirect_to "/online_lending/register/"
  end

  private
  def lender_params
  	params.require(:lender).permit(:fname, :lname, :email, :password, :money, :moneylent)
  end

  def borrower_params
  	params.require(:borrower).permit(:fname, :lname, :email, :password, :purpose, :description, :money, :raised)  	
  end
end
