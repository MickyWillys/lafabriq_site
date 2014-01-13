class CreateCompetences < ActiveRecord::Migration
  def change
    create_table :competences do |t|
      t.string :titre
      t.integer :user_id
      t.string :descriptif
      t.string :experience
      t.string :diplome
      t.string :statut_validation

      t.timestamps
    end
    add_index :competences, :user_id 
  end
end
