class User < ApplicationRecord
  # Inclui os módulos padrão do Devise para autenticação
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # Enum para os papéis de aluno e mentor
  enum role: { aluno: 0, mentor: 1 }

  # Enum para as áreas
  enum area: { geral: 0, mecanica: 1, eletronica: 2, programacao: 3, marketing: 4 }

  # Relacionamentos
  has_many :atividades
  has_many :atividades_participantes

  # Validações
  validates :nome_completo, :username, presence: true
  validates :username, uniqueness: true
end
