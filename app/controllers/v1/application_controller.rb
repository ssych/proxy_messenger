class V1::ApplicationController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :authenticate
  
  private
  def authenticate
    authenticate_token || render_unauthorized
  end

  def authenticate_token
    authenticate_with_http_token do |token, options|
      token == ENV['AUTH_TOKEN']
    end
  end

  def render_unauthorized
    head :unauthorized
  end
end
