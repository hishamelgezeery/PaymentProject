  class ClientsController < ApplicationController
   skip_before_filter :verify_authenticity_token, :only => [:success]

  def index
    @clients = Client.all
  end

  def show
    @payment = Payment.new
  end

  def create_payment
    @payment = Payment.new(payment_params)
    @payment.save
  end


  def admin
    @search = Payment.search(params[:q])
    @payments = @search.result
    @search.build_condition if @search.conditions.empty?
    @search.build_sort if @search.sorts.empty?
  end

  def success
    @defendentName = params["defendantName"]
    @citationNumber = params["citationNo"]
    @address = params["address"]
    @phoneNumber = params["phoneNumber"]
    @email = params["email"]
    @amount = params["amount"]
    @convenienceFee = params["convenienceFee"]
  	@TotalAmt = params["TotalAmt"]
    @new_payment = Payment.new
    @new_payment.defendent_name = params["defendantName"]
    @new_payment.citation_number = params["citationNo"]
    @new_payment.email = params["email"]
    @new_payment.address = params["address"]
    @new_payment.phone_number = params["phoneNumber"]
    @new_payment.amount = params["amount"]
    @new_payment.convenience_fee = params["convenienceFee"]
    @new_payment.total_amount = params["r_AuthorizedAmount"]
    @new_payment.payment_date = Date.strptime(params["TransDate"], "%m/%d/%Y")
    @new_payment.client = @client
    @new_payment_details = PaymentDetail.new
    @new_payment_details.transaction_date = Date.strptime(params["TransDate"], "%m/%d/%Y")
    @new_payment_details.last_four_digits = params["r_LastFour"]
    @new_payment_details.card_type = params["r_CardType"]
    @new_payment_details.authorized_amount = params["r_AuthorizedAmount"]
    @new_payment.save
    @new_payment_details.payment = @new_payment
    @new_payment_details.save

  end
end
