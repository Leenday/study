module Inatra
  class << self
    def routes(&block)
      instance_eval(&block)
    end

    def method_missing(method, *args, &block)
      if args.length == 1
        @routes ||= {}
        @routes[args.first.to_s] ||= {}
        @routes[args.first.to_s][method.to_s.upcase] = block
      else
        super
      end
    end

    def respond_to_missing?(missing_method)
      @routes.include?(missing_method)
    end

    def call(env)
      return [404, {}, ['Not Found']] unless @routes.key?(env['PATH_INFO'])
      return [405, {}, ['Method Not Allowed']] unless @routes[env['PATH_INFO']].key?(env['REQUEST_METHOD'])

      block = @routes[env['PATH_INFO']][env['REQUEST_METHOD']]
      block.call(env)
    end
  end
end
