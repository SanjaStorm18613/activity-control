class AtividadeParticipante < ApplicationRecord
  belongs_to :atividade
  belongs_to :user
end