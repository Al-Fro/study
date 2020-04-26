module Inatra
  class << self
    @@handlers = {}

    def method_missing(method_name, args, &block)
      if method_name
        @@handlers[method_name.to_s] = {}
      else
        super
      end
      @@handlers[method_name.to_s][args] = block.call
    end
    
    def routes(&block)
      instance_eval(&block)
    end

    def call(env)
      method = env['REQUEST_METHOD'].downcase
      path = env['PATH_INFO']
      @@handlers[method][path]
    end
  end
end
