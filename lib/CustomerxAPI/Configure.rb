module CustomerxAPI::Configure

  def api_key(key = nil)
    @api_key = key unless key.nil?
    @api_key
  end

  def api_version(version = nil)
    @api_version = version unless version.nil?
    @api_version
  end

  # def api_version()
  #   @api_version
  # end

  def production!
    @production = true
  end

  def sandbox!
    @production = false
  end

  def production?
    @production == true
  end

  def sandbox?
    @production != true
  end

end