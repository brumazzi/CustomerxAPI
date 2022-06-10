class CustomerxAPI::JourneysClients
  def index(external_id_client)
    CustomerxAPI.send(endpoint({external_id_client: external_id_client}), :get)
  end

  private

  def endpoint(params = {})
    endpoint = 'journeys_clients?'
    params.each do |param|
      endpoint = "#{endpoint}#{param}=#{params[param]}&"
    end
    endpoint[-1] = ''

    endpoint
  end
end