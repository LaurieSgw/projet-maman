class Form < MailForm::Base
  attribute :name,      validate: true
  attribute :email,     validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :phone,     validate: true
  attribute :message,    validate: true
  attribute :nickname,  captcha: true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Demande pour un Appel Découverte",
      :to => "lausegalo@gmail.com",
      :from => "lausegalo@gmail.com"
        }
  end
end
