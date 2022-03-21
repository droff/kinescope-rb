# frozen_string_literal: true

require 'spec_helper'

describe Kinescope::Client do
  subject(:client) { Kinescope::Client.new }

  describe '#initialize' do
    it 'has default api_url' do
      expect(client.api_url).to eq(Kinescope::Client::DEFAULT_API_URL)
    end

    it 'allows access_token to be set' do
      access_token = 'abc123'
      client = Kinescope::Client.new(access_token: access_token)

      expect(client.access_token).to eq(access_token)
    end

    it 'allows api_url to be set' do
      api_url = 'https://api.example.com'
      client = Kinescope::Client.new(api_url: api_url)

      expect(client.api_url).to eq(api_url)
    end

    it 'has default open_timeout' do
      expect(client.open_timeout).to eq(Kinescope::Client::DEFAULT_OPEN_TIMEOUT)
    end

    it 'allows open_timeout to be set' do
      open_timeout = 5
      client = Kinescope::Client.new(open_timeout: open_timeout)
      expect(client.open_timeout).to eq(open_timeout)
    end

    it 'has default timeout' do
      expect(client.timeout).to eq(Kinescope::Client::DEFAULT_TIMEOUT)
    end

    it 'allows timeout to be set' do
      timeout = 5
      client = Kinescope::Client.new(timeout: timeout)
      expect(client.timeout).to eq(timeout)
    end
  end

  describe '#connection' do
    it 'sets the content type' do
      content_type = 'application/json'
      expect(client.connection.headers['Content-Type']).to eq(content_type)
    end

    it 'has default user agent' do
      stub_const('Kinescope::VERSION', '0.0.0')
      user_agent = 'kinescope-rb/0.0.0'
      expect(client.connection.headers['User-Agent']).to eq(user_agent)
    end

    it 'with provided user agent' do
      user_agent = 'kinescope'
      client = Kinescope::Client.new(user_agent: user_agent)
      expect(client.connection.headers['User-Agent']).to include(user_agent)
    end
  end

  describe '#method_missing' do
    it 'calls an existing method' do
      expect { client.videos }.to_not raise_error
    end

    it 'calls a missing method' do
      expect { client.its_missing_method }.to raise_error(NoMethodError)
    end
  end
end
