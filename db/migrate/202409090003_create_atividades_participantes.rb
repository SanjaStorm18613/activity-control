class CreateAtividadesParticipantes < ActiveRecord::Migration[7.0]
  def change
    create_table :atividades_participantes do |t|
      t.references :atividade, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true  # Aluno participante

      t.timestamps
    end
  end
end
