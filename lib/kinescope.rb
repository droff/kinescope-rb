# frozen_string_literal: true

require 'kinescope/version'
require 'resource_kit'
require 'kartograph'

module Kinescope
  autoload :Client, 'kinescope/client'

  # Models
  autoload :BaseModel, 'kinescope/models/base_model'
  autoload :DRM, 'kinescope/models/drm'
  autoload :Video, 'kinescope/models/video'
  
  # Mappings
  autoload :DRMMapping, 'kinescope/mappings/drm_mapping'
  autoload :VideoMapping, 'kinescope/mappings/video_mapping'

  # Resources
  autoload :DRMResource, 'kinescope/resources/drm_resource'
  autoload :VideoResource, 'kinescope/resources/video_resource'

  # Meta
  autoload :Meta, 'kinescope/models/meta'
  autoload :Order, 'kinescope/models/meta'
  autoload :Pagination, 'kinescope/models/meta'
  autoload :MetaMapping, 'kinescope/mappings/meta_mapping'
  autoload :PaginationResource, 'kinescope/pagination_resource'
end