class MessengerProviders::Telegram
  class << self
    def send_message(message)
      Rails.logger.debug(["Telegram", :send_message, message])
    end
  end
end
