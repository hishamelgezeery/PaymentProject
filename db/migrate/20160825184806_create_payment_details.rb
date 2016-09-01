class CreatePaymentDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :payment_details do |t|
      t.string :transaction_date
      t.integer :last_four_digits
      t.string :card_type
      t.decimal :authorized_amount, :precision => 8, :scale => 2
      t.references :payment, foreign_key: true

      t.timestamps
    end
  end
end
