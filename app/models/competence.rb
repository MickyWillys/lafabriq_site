class Competence < ActiveRecord::Base

belongs_to :user

validates :titre, presence: true, length: { maximum: 50 }
validates :descriptif, presence: true, length: { maximum: 500 }
validates :experience, presence: true



end
