namespace :admin do
  desc "Cria um usuário admin como mentor"
  task create: :environment do
    # Verifica se o usuário admin já existe
    if User.find_by(username: 'admin')
      puts "Usuário admin já existe!"
    else
      # Cria o usuário admin usando Devise
      admin = User.new(
        nome_completo: 'Admin',
        username: 'admin',
        email: 'diego.adm.rocha@gmail.com', # Email obrigatório para Devise
        password: 'diego2356', # Defina uma senha forte aqui
        password_confirmation: 'diego2356', # Confirmação de senha
        role: :mentor,
        area: :geral # Defina a área desejada
      )

      if admin.save
        puts "Usuário admin criado com sucesso!"
      else
        puts "Erro ao criar usuário admin: #{admin.errors.full_messages.join(", ")}"
      end
    end
  end
end
