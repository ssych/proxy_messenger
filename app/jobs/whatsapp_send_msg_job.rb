class WhatsappSendMsgJob < ApplicationJob

  def perform(id)
    message = Message.find(id)
    message.to_send!
  end

end