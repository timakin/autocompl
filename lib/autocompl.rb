require 'autocompl/engine'
require 'autocompl/definder'

module Autocompl
end

class ActionController::Base
  include Autocompl::Definder
end
