class CustomerxAPI::Users
  def index(**kwds)
    CustomerxAPI.send(endpoint(kwds), :get)
  end

  private

  def endpoint(params = {})
    endpoint = 'users?'
    params.each do |param|
      endpoint = "#{endpoint}#{param}=#{params[param]}&"
    end
    endpoint[-1] = ''

    endpoint
  end
end