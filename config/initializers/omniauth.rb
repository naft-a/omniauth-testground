Rails.application.config.middleware.use OmniAuth::Builder do
  provider :deploy, "CLIENT_ID", "CLIENT_SECRET", client_options: { site: 'http://deploy.localhost'}, scope: 'deployments'
rescue StandardError => exception
  raise "Invalid Omniauth config #{exception.inspect}"
end
