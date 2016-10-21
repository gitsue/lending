class CreateBorrowers < ActiveRecord::Migration
  def change
    create_table :borrowers do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :password_digest
      t.integer :money
      t.string :purpose
      t.text :description
      t.integer :raised

      t.timestamps
    end
  end
end
