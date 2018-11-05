class SendMsgJob < ApplicationJob

  def perform(id)
    message = Message.find(id)
    MessengerService.send_message(message.provider, message.data)
    message.to_send!
  rescue => error
    message.make_system_error!
    raise error
  end

end