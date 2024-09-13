class MentoresController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_mentor!

  def index
    @alunos = User.aluno
  end

  def register_student
    @user = User.new(role: :aluno)
  end

  def create_student
    @user = User.new(user_params.merge(role: :aluno))
    if @user.save
      redirect_to mentores_path, notice: 'Aluno registrado com sucesso.'
    else
      render :register_student
    end
  end

  def register_mentor
    @user = User.new(role: :mentor)
  end

  def create_mentor
    @user = User.new(user_params.merge(role: :mentor))
    if @user.save
      redirect_to mentores_path, notice: 'Mentor registrado com sucesso.'
    else
      render :register_mentor
    end
  end

  private

  def authorize_mentor!
    redirect_to root_path, alert: 'Acesso negado.' unless current_user.mentor?
  end

  def user_params
    params.require(:user).permit(:nome_completo, :username, :password, :area)
  end
end
