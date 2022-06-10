class CustomerxAPI::BranchClients
  def update(client_id, **kwds)
    CustomerxAPI.send(endpoint(client_id), :put, kwds)
  end

  private

  def endpoint(id)
    "clients/#{id}/branch_clients"
  end
end