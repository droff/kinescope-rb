# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Kinescope::DRMResource do
  include_context 'client'
  subject(:resource) { described_class.new(connection: connection) }

  describe '#show' do
    it 'returns drm state' do
      api_stub('/v1/drm/auth', :get).to_return(body: api_fixture('drm/show'))

      drm = resource.show
      expect(drm).to be_kind_of(Kinescope::DRM)
    end
  end

  describe '#update' do
    it 'updates drm state' do
      api_stub('/v1/drm/auth', :put).to_return(body: api_fixture('drm/update'))

      new_drm = Kinescope::DRM.new(
        url: 'https://example.org/auth/kinescope',
        username: 'testusername',
        password: 'testpassword'
      )
      drm = resource.update(new_drm)

      expect(drm).to be_kind_of(Kinescope::DRM)
      expect(drm.url).to eq(new_drm.url)
      expect(drm.username).to eq(new_drm.username)
      expect(drm.password).to eq(new_drm.password)
    end
  end

  describe '#delete' do
    it 'deactivates drm' do
      api_stub('/v1/drm/auth', :delete).to_return(body: nil)
      expect(resource.delete).to be_truthy
    end
  end
end