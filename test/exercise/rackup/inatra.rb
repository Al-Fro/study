module Inatra
  class << self

    def routes(&block)
      @routes = {}
      instance_eval(&block)
    end

    def call(env)
      method = env['REQUEST_METHOD'].downcase
      path = env['PATH_INFO']

      if @routes[method][path].nil?
        [404, {}, 'Not Found']
      else
        @routes[method][path]
      end
    end

    def method_missing(method_name, args, &block)
      @routes[method_name.to_s] = {} if @routes[method_name.to_s].nil?
      @routes[method_name.to_s][args] = block.call
    end
  end
end
