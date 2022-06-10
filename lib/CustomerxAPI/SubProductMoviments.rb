class CustomerxAPI::SubProductMoviments
  def create(**kwds)
    CustomerxAPI.send(endpoint, :post, kwds)
  end

  private

  def endpoint(params = {})
    endpoint = 'sub_product_moviments?'
    params.each do |param|
      endpoint = "#{endpoint}#{param}=#{params[param]}&"
    end
    endpoint[-1] = ''

    endpoint
  end
end