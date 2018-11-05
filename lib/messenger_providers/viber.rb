class MessengerProviders::Viber
  class << self
    def send_message(message)
      Rails.logger.info(["Viber", :send_message, message])
    end
  end
end
