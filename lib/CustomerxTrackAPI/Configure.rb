module CustomerxTrackAPI::Configure

  def credential(_credential = nil)
    @credential = _credential unless _credential.nil?
    @credential
  end

  def key(_key = nil)
    @key = _key unless _key.nil?
    @key
  end

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