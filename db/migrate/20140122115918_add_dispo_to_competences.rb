class AddDispoToCompetences < ActiveRecord::Migration
  def change
    add_column :competences, :dispo, :boolean
    add_column :competences, :dispo_debut, :datetime
    add_column :competences, :dispo_fin, :datetime
  end
end
