class CustomerxAPI::Indicators
  def index(**kwds)
    CustomerxAPI.send(endpoint(kwds), :get)
  end

  private

  def endpoint(params = {})
    endpoint = 'indicators/clients_in_churn_risk?'
    params.each do |param|
      endpoint = "#{endpoint}#{param}=#{params[param]}&"
    end
    endpoint[-1] = ''

    endpoint
  end
end
