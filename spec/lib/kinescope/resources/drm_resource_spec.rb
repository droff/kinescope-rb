# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Kinescope::DRMResource do
  include_context 'client'
  subject(:resource) { described_class.new(connection: connection) }

  let(:project_id) { 12345 }

  describe '#find' do
    it 'returns drm state for given project' do
      api_stub("/v1/drm/auth/#{project_id}", :get).to_return(body: api_fixture('drm/find'))

      drm = resource.find(project_id: 12345)
      expect(drm).to be_kind_of(Kinescope::DRM)
    end
  end

  describe '#update' do
    it 'updates drm state for given project' do
      api_stub("/v1/drm/auth/#{project_id}", :put).to_return(body: api_fixture('drm/update'))

      new_drm = Kinescope::DRM.new(
        url: 'https://example.org/auth/kinescope',
        username: 'testusername',
        password: 'testpassword'
      )
      drm = resource.update(new_drm, project_id: 12345)

      expect(drm).to be_kind_of(Kinescope::DRM)
      expect(drm.url).to eq(new_drm.url)
      expect(drm.username).to eq(new_drm.username)
      expect(drm.password).to eq(new_drm.password)
    end
  end

  describe '#delete' do
    it 'deactivates drm' do
      api_stub("/v1/drm/auth/#{project_id}", :delete).to_return(body: nil)

      expect(resource.delete(project_id: project_id)).to be_truthy
    end
  end
end