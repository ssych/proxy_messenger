class SendMsgJob < ApplicationJob

  def perform(id)
    message = Message.find(id)
    MessengerService.send_message(message.provider, message.data)
    message.to_send!
  end

end