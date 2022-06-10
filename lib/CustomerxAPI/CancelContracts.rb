class CustomerxAPI::CancelContracts
  def create(**kwds)
    CustomerxAPI.send(endpoint, :post, kwds)
  end

  private

  def endpoint(params = {})
    endpoint = 'cancel_contracts?'
    params.each do |param|
      endpoint = "#{endpoint}#{param}=#{params[param]}&"
    end
    endpoint[-1] = ''

    endpoint
  end
end