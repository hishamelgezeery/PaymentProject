class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :subdomain
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
