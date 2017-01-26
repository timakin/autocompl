require 'autocompl/engine'
require 'autocompl/base'
require 'autocompl/railtie'

module Autocompl
end

class ActionController::Base
  include Autocompl::Base
end
