require 'autocompl/repository'

module Autocompl
  module Definder
    def self.included(target)
      target.extend Autocompl::Definder::ClassMethods
      target.send :include, Autocompl::Repository
    end

    module ClassMethods
      def autocomplete(options = {})
        define_method('autocomplete_endpoint') do
          render json: [] if params[:term].nil?
          render json: [] if options.nil?
          klasses = options.keys
          items = []
          for klass in klasses
            columns = options[klass].instance_of?(Array) ? options[klass] : [] << options[klass]
            items.concat(get_collection(klass, columns))
          end
          render json: items
        end
      end
    end
  end
end
