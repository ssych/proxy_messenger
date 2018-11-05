class V1::MessagesController < V1::ApplicationController
  before_action :set_message, only: [:show]

  def create
    provider = params['provider']
    user_id = message_params[:user_id]
    data = message_params[:data]

    @message = Message.create!(data: data, provider: provider, user_id: user_id)
    SendMsgJob.perform_later(@message.id)
  end

  def show
  end

  private

  def set_message
    @message = Message.find(params[:guid])
  end

  def message_params
    params.permit(:user_id, :data)
  end

end
