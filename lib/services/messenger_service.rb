class MessengerService

  class << self
    def send_message(provider, message)
      return unless message.present? && provider.present?
      "MessengerProviders::#{provider.capitalize}".safe_constantize.send_message(message)
    end
  end

end
