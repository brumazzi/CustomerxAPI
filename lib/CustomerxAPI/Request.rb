require "uri"
require "json"
require "net/http"

module CustomerxAPI::Request
  def uri(endpoint)
    "https://#{'sandbox.' if sandbox?}api.customerx.com.br/api/#{api_version}/#{endpoint}"
  end

  def send(endpoint, method, **body)
    cx_uri = uri(endpoint)

    https = Net::HTTP.new(cx_uri.host, cx_uri.port)
    https.use_ssl = true

    case method.to_sym
    when :get
      request = Net::HTTP::Get.new(cx_uri)
    when :post
      request = Net::HTTP::Post.new(cx_uri)
    when :put
      request = Net::HTTP::Put.new(cx_uri)
    when :delete
      request = Net::HTTP::Delete.new(cx_uri)
    else
      raise "Invalid method '#{method}'!"
    end

    request['Content-Type'] = 'application/json'
    request['api_key'] = api_key
    request.body = JSON.dump(**body)

    response = https.request(request)
    {
      status: response.code,
      data: JSON.generate(response.body)
    }
  end

end
