require "uri"
require "json"
require "net/http"

module CustomerxTrackAPI::Request
  def uri
    "https://#{'sandbox.' if sandbox?}tracker.customerx.com.br"
  end

  def create(external_id_client, type_tracking, identifier, email)
    cx_uri = uri

    https = Net::HTTP.new(cx_uri.host, cx_uri.port)
    https.use_ssl = true

    request = Net::HTTP::Post.new(cx_uri)
    request['Content-Type'] = 'application/json'
    request['credential'] = credential
    request['key'] = key
    request.body = JSON.dump(
      external_id_client: external_id_client,
      type_tracking: type_tracking,
      identifier: identifier,
      email: email
    )

    response = https.request(request)
    {
      status: response.code,
      data: JSON.generate(response.body)
    }
  end
end
