class MessengerProviders::Whatsapp
  class << self
    def send_message(message)
      Rails.logger.info(["Whatsapp", :send_message, message])
    end
  end
end
