class Payment < ApplicationRecord
  belongs_to :client
  has_one :payment_detail

  #attr_accessible :defendent_name, :citation_number,  :email, :address, :phone_number, :amount, :convenience_fee, :total_amount, :isPaid, :client
end
