module Kinescope
  class PaginationResource
    include Enumerable

    attr_reader :action, :args, :resource
    attr_accessor :page, :per_page, :total

    def initialize(action, resource, *args)
      @action = action
      @resource = resource
      @args = args

      @collection = []
      @page = nil
      @per_page = nil
      @total = nil
    end

    def [](index)
      @collection[index]
    end

    def each(&block)
      handle_response if total.nil?
      return to_enum(:each) unless block_given?

      @collection.each { |element| yield(element) }

      self
    end

    private

    def handle_response
      invoker = ResourceKit::ActionInvoker.new(action, resource, *args)
      @collection = invoker.handle_response

      meta = Kinescope::MetaMapping.extract_single(invoker.response.body, :read)
      self.page = meta.pagination.page
      self.per_page = meta.pagination.per_page
      self.total = meta.pagination.total
    end
  end
end