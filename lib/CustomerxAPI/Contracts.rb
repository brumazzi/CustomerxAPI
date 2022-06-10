class CustomerxAPI::Contracts
  def index(**kwds)
    CustomerxAPI.send(endpoint(kwds), :get)
  end

  def show(external_id)
    index({ external_id: external_id })
  end

  def create(**kwds)
    CustomerxAPI.send(endpoint, :post, kwds)
  end

  def update(external_id, **kwds)
    CustomerxAPI.send(endpoint({ external_id: external_id }), :put, kwds)
  end

  def destroy(external_id)
    CustomerxAPI.send(endpoint({ external_id: external_id }), :delete)
  end

  def reactive
    CustomerxAPI.send(endpoint({ external_id: external_id }, true), :post)
  end

  private

  def endpoint(params = {}, reactive = false)
    endpoint = "clients#{'/reactivate_contract' if reactive}?"
    params.each do |param|
      endpoint = "#{endpoint}#{param}=#{params[param]}&"
    end
    endpoint[-1] = ''

    endpoint
  end
end