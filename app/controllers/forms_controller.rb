class FormsController < ApplicationController

  def new
    @form = Form.new
  end

  def create
    @form = Form.new(form_params)
    @form.request = request

   if @form.deliver
    redirect_to prendrerdv_path, notice: "Message envoyé !"
  else
    flash.now[:error] = "Erreur lors de l'envoi"
    render "pages/prendrerdv", status: :unprocessable_entity
  end

  end

  private

  def form_params
    params.require(:form).permit(:name, :email, :phone, :message, :nickname)
  end
end
