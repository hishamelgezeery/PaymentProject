class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :get_client

def payment_params
    params.require(:payment).permit(:defendent_name, :citation_number,  :email, :address, :phone_number, :amount, :convenience_fee, :total_amount, :isPaid, :client_id)
  end
private
  def get_client

    clients = Client.where(subdomain: request.subdomain)

    if clients.count > 0
      @client = clients.first
    elsif request.subdomain != 'www'
    	redirect_to root_url(subdomain: 'www')
    end
  end
end
