require 'autocompl/engine'

module Autocompl
end

class ActionController::Base
    include Autocompl::Definder
end
