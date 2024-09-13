class AtividadesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_atividade, only: [:show, :edit, :update, :destroy]
  before_action :authorize_mentor!, only: [:destroy, :export_pdf, :register_student, :register_mentor]

  def index
    @atividades = Atividade.filter_by_area(params[:area])
  end

  def show
  end

  def new
    @atividade = Atividade.new
    @students = User.aluno
    @mentors = User.mentor
  end

  def create
    @atividade = current_user.atividades.build(atividade_params)
    if @atividade.save
      redirect_to atividades_path, notice: 'Atividade registrada com sucesso.'
    else
      render :new
    end
  end

  def destroy
    @atividade.destroy
    redirect_to atividades_path, notice: 'Atividade excluída.'
  end

  def export_pdf
    @atividades = Atividade.filter_by_area(params[:area])
    pdf = Prawn::Document.new
    @atividades.each do |atividade|
      pdf.text "Temática: #{atividade.tematica}"
      pdf.text "Área: #{atividade.area}"
      pdf.text "Responsável: #{atividade.responsavel.nome_completo}"
      pdf.text "Criado por: #{atividade.user.nome_completo}"
      pdf.move_down 10
    end
    send_data pdf.render, filename: 'atividades.pdf', type: 'application/pdf', disposition: 'inline'
  end

  private

  def set_atividade
    @atividade = Atividade.find(params[:id])
  end

  def authorize_mentor!
    redirect_to root_path, alert: 'Acesso negado.' unless current_user.mentor?
  end

  def atividade_params
    params.require(:atividade).permit(:tematica, :area, :objetivo, :acoes_realizadas, :numero_participantes, :responsavel_id, participante_ids: [])
  end
end
