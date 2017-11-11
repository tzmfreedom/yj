module Yj
  class Render
    def initialize(context)
      @context = context
    end

    def call(options)
      options[:locals] ||= {}
      options[:locals].merge!(r: self, _partial: true) if options[:collection].present?
      yaml = @context.render options
      YAML.load(yaml).to_json
    end
  end
end