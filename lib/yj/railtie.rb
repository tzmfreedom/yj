require 'yj/handler'

module Yj
  class Railtie < Rails::Railtie
    initializer :yj do
      ActiveSupport.on_load :action_view do
        ActionView::Template.register_template_handler :yj, ::Yj::Handler
      end
    end
  end
end