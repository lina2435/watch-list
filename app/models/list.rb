class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  validates :name, uniqueness: true, presence: true
  # Una has_many :through Esta asociación indica que el modelo declarante
  # se puede emparejar con cero o más instancias de otro modelo procediendo
  # a través de un tercer modelo
end
