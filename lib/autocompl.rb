require 'autocompl/engine'
require 'autocompl/base'

module Autocompl
end

class ActionController::Base
  include Autocompl::Base
end
