# frozen_string_literal: true

require 'kinescope/version'
require 'resource_kit'
require 'kartograph'

module Kinescope
  autoload :Client, 'kinescope/client'

  # Models
  autoload :BaseModel, 'kinescope/models/base_model'
  autoload :DRM, 'kinescope/models/drm'
  autoload :Project, 'kinescope/models/project'
  autoload :Video, 'kinescope/models/video'
  
  # Mappings
  autoload :DRMMapping, 'kinescope/mappings/drm_mapping'
  autoload :ProjectMapping, 'kinescope/mappings/project_mapping'
  autoload :VideoMapping, 'kinescope/mappings/video_mapping'

  # Resources
  autoload :DRMResource, 'kinescope/resources/drm_resource'
  autoload :ProjectResource, 'kinescope/resources/project_resource'
  autoload :VideoResource, 'kinescope/resources/video_resource'

  # Meta
  autoload :Meta, 'kinescope/models/meta'
  autoload :Order, 'kinescope/models/meta'
  autoload :Pagination, 'kinescope/models/meta'
  autoload :MetaMapping, 'kinescope/mappings/meta_mapping'
  autoload :PaginationResource, 'kinescope/pagination_resource'

  # Errors
  autoload :ErrorHandler, 'kinescope/error_handler'
  Error = Class.new(StandardError)
  AccessDeniedError = Class.new(Kinescope::Error)
  BadRequestError = Class.new(Kinescope::Error)
  NotFoundError = Class.new(Kinescope::Error)
  PaymentRequired = Class.new(Kinescope::Error)
  UnauthorizedError = Class.new(Kinescope::Error)
end