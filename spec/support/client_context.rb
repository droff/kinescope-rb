# frozen_string_literal: true

shared_context 'client' do
  # set `options` helper if you want to a client be initialized with options
  # e.g. let(:options) { { access_token: 'abc123' } }
  let(:client) do
    return Kinescope::Client.new(options) if defined?(options)

    Kinescope::Client.new
  end

  let(:connection) { client.connection }

  # default `headers` helper if options[:access_token] was defined
  let(:headers) do
    return unless defined?(options)

    { authorization: "Bearer #{options[:access_token]}" }
  end
end