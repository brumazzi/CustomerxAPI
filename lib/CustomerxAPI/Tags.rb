class CustomerxAPI::Tags
  def index(**kwds)
    CustomerxAPI.send(endpoint(kwds), :get)
  end

  def show(id)
    CustomerxAPI.send("#{endpoint}/#{id}", :get)
  end

  def create(**kwds)
    CustomerxAPI.send(endpoint, :post, kwds)
  end

  def update(external_id, **kwds)
    CustomerxAPI.send("#{endpoint}/#{external_id}", :put, kwds)
  end

  def destroy(external_id)
    CustomerxAPI.send("#{endpoint}/#{external_id}", :delete)
  end

  private

  def endpoint(params = {})
    endpoint = 'tags?'
    params.each do |param|
      endpoint = "#{endpoint}#{param}=#{params[param]}&"
    end
    endpoint[-1] = ''

    endpoint
  end
end