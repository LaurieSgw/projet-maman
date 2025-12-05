class PagesController < ApplicationController

  def home
  end

  def prestations
  end

  def prendrerdv
    @form = Form.new
  end

  def create
  @form = Form.new(params[:form])
    @form.request = request
    if @form.deliver
      flash.now[:success] = 'Message envoyé !'
    else
      flash.now[:error] = 'Could not send message'
      render :prendrerdv
    end
  end

  def contact
  end

end
