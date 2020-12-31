class CreateContracts < ActiveRecord::Migration[6.0]
  def change
    create_table :contracts do |t|
      t.string :number
      t.string :lastname
      t.string :firstname
      t.string :register
      t.string :address
      
      t.timestamps
    end
  end
end
