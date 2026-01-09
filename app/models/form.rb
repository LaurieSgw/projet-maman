class Form < MailForm::Base
  attribute :name,      validate: true
  attribute :email,     validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :phone,     validate: true
  attribute :message,    validate: true
  attribute :nickname,  captcha: true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  ddef headers
    {
      subject: "Demande pour un Appel Découverte",
      to: ENV['CONTACT_EMAIL'],       # <- ton email qui reçoit le message
      from: ENV['SMTP_EMAIL'],        # <- email vérifié sur Brevo
      reply_to: email                 # <- email du visiteur
    }
  end
end
