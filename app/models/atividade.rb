class Atividade < ApplicationRecord
  belongs_to :user  # Criador
  belongs_to :responsavel, class_name: 'User'
  has_many :atividades_participantes
  has_many :participantes, through: :atividades_participantes, source: :user

  enum area: { geral: 0, mecanica: 1, eletronica: 2, programacao: 3, marketing: 4 }

  validates :tematica, :objetivo, :acoes_realizadas, :numero_participantes, presence: true
end