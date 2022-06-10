module CustomerxTrackAPI
  require "CustomerxTrackAPI/Configure"
  require "CustomerxTrackAPI/Request"
  require 'Version'

  extend CustomerxTrackAPI::Configure
  extend CustomerxTrackAPI::Request
  extend Version
end