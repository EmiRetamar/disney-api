class User < ApplicationRecord
  # encrypt password
  has_secure_password # INVESTIGAR SOBRE ESTO

  # Model associations
  # Relacion 1-N. Rails define que los :projects van a tener el id del usuario en el campo :created_by
  has_many :projects, foreign_key: :created_by
  # Validations
  validates_presence_of :name, :email, :password_digest
end
