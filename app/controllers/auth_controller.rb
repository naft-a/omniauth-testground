class AuthController < ApplicationRecord
  def callback
    authenticate_with(auth_hash.credentials.token)
    response = send_request(http_method: :get, endpoint: '/projects/afa/deployments')

    render json: response
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end

  def send_request(http_method:, endpoint:, params: {})
    @response = @client.public_send(http_method) do |request|
      request.headers['Content-Type'] = 'application/json' if http_method == :post
      request.headers['Accept'] = 'application/json'
      request.url endpoint
      request.body params

      config.adapter Faraday.default_adapter
    end
  end

  def authenticate_with(token)
    @client = Faraday.new('http://deploy.localhost') do |config|
      config.use FaradayMiddleware::OAuth2, token
      config.request :json
      config.response :json

      config.adapter Faraday.default_adapter
    end
  end
end
