require 'rspec'
require 'httparty'
require 'cucumber'
require 'json'
require 'pry'
require 'report_builder'
require 'json-schema'
require_relative 'data'

Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

ENV["ENV"] = "qa" unless ENV.key? "ENV"

ENVIRONMENT = YAML.load_file("./base_uri.yml")[ENV["ENV"]]

# CLASS PARA FACILITAR AS CHAMADAS DE API
class Http
  include HTTParty
  include RSpec::Matchers

  base_uri ENVIRONMENT["api"]
  format :json
end

World(DataLoad)
