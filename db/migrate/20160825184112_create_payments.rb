class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.string :defendent_name
      t.string :citation_number
      t.string :email
      t.string :address
      t.string :phone_number
      t.decimal :amount, :precision => 8, :scale => 2
      t.decimal :convenience_fee, :precision => 8, :scale => 2
      t.decimal :total_amount, :precision => 8, :scale => 2
      t.date :payment_date, :null => true
      t.references :client, foreign_key: true
    end
  end
end
