module Autocompl
  class Railtie < ::Rails::Railtie
    config.cache_autocomplete = false
    config.cache_expire = 30.minutes
  end
end
