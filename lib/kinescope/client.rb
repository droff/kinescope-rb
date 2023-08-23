# frozen_string_literal: true

require 'faraday'

module Kinescope
  class Client
    DEFAULT_API_URL = 'https://api.kinescope.io'.freeze
    DEFAULT_TIMEOUT = 120
    DEFAULT_OPEN_TIMEOUT = 60

    attr_reader :access_token, :api_url, :open_timeout, :timeout, :user_agent

    def initialize(options = {})
      @access_token = options[:access_token]
      @api_url = options[:api_url] || DEFAULT_API_URL
      @open_timeout = options[:open_timeout] || DEFAULT_OPEN_TIMEOUT
      @timeout = options[:timeout] || DEFAULT_TIMEOUT
      @user_agent = options[:user_agent]
    end

    def connection
      @connection ||= Faraday.new(connection_options) do |req|
        req.adapter :net_http
        req.options.timeout = timeout
        req.options.open_timeout = open_timeout
      end
    end

    def self.resources
      {
        drm: DRMResource,
        projects: ProjectResource,
        videos: VideoResource
      }
    end

    def resources
      @resources ||= {}
    end

    def method_missing(name, *args, &block)
      if self.class.resources.keys.include?(name)
        resources[name] ||= self.class.resources[name].new(connection: connection)
        resources[name]
      else
        super
      end
    end

    def default_user_agent
      "kinescope-rb/#{Kinescope::VERSION}"
    end

    private

    def connection_options
      {
        url: api_url,
        headers: {
          authorization: "Bearer #{access_token}",
          content_type: 'application/json',
          user_agent: "#{user_agent} #{default_user_agent}".strip
        }
      }
    end
  end
end