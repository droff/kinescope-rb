# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Kinescope::ProjectResource do
  include_context 'client'
  subject(:resource) { described_class.new(connection: connection) }

  let(:project_id) { '12345' }

  describe '#find' do
    it 'returns project' do
      api_stub("/v1/projects/#{project_id}", :get).to_return(body: api_fixture('projects/find'))

      project = resource.find(project_id: 12345)

      expect(project).to be_kind_of(Kinescope::Project)
      expect(project.id).to eq(project_id)
    end
  end
end