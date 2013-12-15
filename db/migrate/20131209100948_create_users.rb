class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :prenom
      t.string :nom
      t.string :email
      t.string :telephone_fixe
      t.string :telephone_portable
      t.string :code_postal
      t.string :tranche_age

      t.timestamps
    end
  end
end
