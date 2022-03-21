# frozen_string_literal: true

module StubRequestHelpers
  def api_stub(path, verb = :any)
    api_url = Kinescope::Client::DEFAULT_API_URL
    escaped_path = Regexp.escape(path)
    stub_request(verb, /#{api_url}#{escaped_path}/)
  end

  def api_fixture(fixture_name)
    Pathname.new('./spec/fixtures').join("#{fixture_name}.json").read
  end
end