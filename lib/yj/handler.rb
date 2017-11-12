require 'action_dispatch/http/mime_type'
require 'yj/render'
require 'multi_json'

module Yj
  class Handler
    cattr_accessor :default_format
    self.default_format = Mime[:json]

    def self.call(template)
      <<~SRC
      _partial ||= false
      r ||= Yj::Render.new(self)
      yaml = ERB.new(%{#{template.source}}, nil, '-').result(binding)
      return MultiJson.dump(YAML.load(yaml)) unless _partial
      yaml.each_line.with_index.map do |line, idx|
        idx == 0 ? "- \#{line}" : "  \#{line}"
      end.join
      SRC
    end
  end
end
