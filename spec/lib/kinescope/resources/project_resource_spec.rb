# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Kinescope::ProjectResource do
  include_context 'client'
  subject(:resource) { described_class.new(connection: connection) }

  let(:project_id) { '12345' }

  describe '#find' do
    it 'returns project' do
      api_stub("/v1/projects/#{project_id}", :get).to_return(body: api_fixture('projects/find'))

      project = resource.find(project_id: project_id)

      expect(project).to be_kind_of(Kinescope::Project)
      expect(project.id).to eq(project_id)
    end
  end

  describe '#update' do
    it 'updates propject' do
      api_stub("/v1/projects/#{project_id}", :put).to_return(body: api_fixture('projects/update'))

      new_project = Kinescope::Project.new(encrypted: true)
      project = resource.update(new_project, project_id: project_id)

      expect(project).to be_kind_of(Kinescope::Project)
      expect(project.encrypted).to be_truthy
    end
  end
end