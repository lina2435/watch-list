class Bookmark < ApplicationRecord
  belongs_to :list
  belongs_to :movie
  # Una película debe tener un título único.
  # Un marcador debe estar vinculado a una película y
  # una lista, y las parejas de [película, lista] deben ser únicas.
  validates :movie, uniqueness: { scope: :list,
    message: "is already in the list" }
  # El comentario de un marcador no puede tener menos de 6 caracteres.
  validates :comment, length: { minimum: 6 }
end
