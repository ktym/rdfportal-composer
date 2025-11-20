# frozen_string_literal: true
require "rubygems"
require "sinatra/base"
require "json"
require "socket"

RDFCONFIG_PREFIX = ENV["RDFCONFIG_PREFIX"] || "../"
$LOAD_PATH.unshift("#{$RDFCONFIG_PREFIX}/rdf-config/lib")
require 'rdf-config'

class Composer < Sinatra::Base
  configure do
    enable :logging
    set :host_authorization, {
      permitted_hosts: [
        "rdfportal.org",
        "127.0.0.1",
        "0.0.0.0",
        "localhost"
      ]
    }
    set :public_folder, "public"
    set :static, true
  end

  before { puts "DEBUG Host=#{request.host}" }

  get "/composer/" do
    content_type "text/html"
    File.read("index.html")
  end

  get "/composer/sparql/:dataset/:variables" do
    path = "config/#{params[:dataset]}"
    #args = params[:variables].split(/,\s*/).join(" ")
    args = params[:variables].split(/,\s*/)
    logger.info "[REST] build SPARQL: path=#{path} args=#{args}"
    if File.exist?("#{RDFCONFIG_PREFIX}/rdf-config/#{path}")
      config = RDFConfig::Config.new("#{RDFCONFIG_PREFIX}/rdf-config/#{path}")
      sparql = RDFConfig::SPARQL.new(config, {query: args}).generate
    else
      sparql = "ERROR: something went wrong"
    end
    content_type "text/plain"
    sparql
  end
end

