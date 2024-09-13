class CreateAtividades < ActiveRecord::Migration[7.0]
  def change
    create_table :atividades do |t|
      t.string :tematica
      t.integer :area, null: false  # Enum: 0 = geral, 1 = mecanica, 2 = eletronica, 3 = programacao, 4 = marketing
      t.text :objetivo
      t.text :acoes_realizadas
      t.integer :numero_participantes
      t.references :responsavel, foreign_key: { to_table: :users }
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
