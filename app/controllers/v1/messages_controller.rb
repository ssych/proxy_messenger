class V1::MessagesController < V1::ApplicationController
  before_action :set_message, only: [:show]

  def create
    messager_type = params['type']
    user_id = message_params[:user_id]
    data = message_params[:data]

    @message = Message.create!(data: data, messager_type: messager_type, user_id: user_id)
    [messager_type, '_send_msg_job'].join.classify.constantize.perform_later(@message.id)
  end

  def show
  end

  private

  def set_message
    @message = Message.find(params[:guid])
  end

  def message_params
    params.permit!
  end

end
