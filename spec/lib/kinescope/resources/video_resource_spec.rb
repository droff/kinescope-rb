# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Kinescope::VideoResource do
  include_context 'client'
  subject(:resource) { described_class.new(connection: connection) }

  describe '#all' do
    it 'returns all of the videos' do
      api_stub('/v1/videos', :get).to_return(body: api_fixture('videos/all'))
      videos = resource.all
      expect(videos).to all(be_kind_of(Kinescope::Video))
    end
  end
end