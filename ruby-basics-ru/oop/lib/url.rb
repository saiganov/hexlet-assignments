# frozen_string_literal: true
require 'forwardable'
require 'uri'

# BEGIN
class Url
  extend Forwardable
  include Comparable

  def initialize(url)
    @uri =  URI(url)
    @q_params = if @uri.query.nil?
      {}
    else
      URI.decode_www_form(@uri.query).to_h.transform_keys(&:to_sym)
    end
  end

  def_delegators :@uri, :scheme, :host, :port

  def query_params
    @q_params
  end

  def query_param(key, default = nil)
    @q_params.fetch(key, default)
  end

  def <=>(other)
    [scheme, host, port, query_params] <=> [other.scheme, other.host, other.port, other.query_params]  end
end