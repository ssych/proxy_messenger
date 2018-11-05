class V1::PackagesController < V1::ApplicationController
  before_action :set_packages, only: [:show]

  def create
    user_id = package_params[:user_id]
    data = package_params[:data]
    @package = Package.create!
    
    package_params[:providers].compact.uniq.each do |provider|
      message = Message.create!(data: data, provider: provider, user_id: user_id, package_id: @package.id)
      SendMsgJob.perform_later(message.id)
    end
  end

  def show
  end

  private

  def set_packages
    @package = Package.find(params[:guid])
  end

  def package_params
    params.permit(:user_id, :data, :providers=>[])
  end

end
