require 'autocompl/repository'

module Autocompl
  module Base
    BASE_CACHE_KEY = 'autocomplete_cache'.freeze

    def self.included(target)
      target.extend Autocompl::Base::ClassMethods
      target.send :include, Autocompl::Repository
    end

    module ClassMethods
      def autocomplete(options = {})
        define_method('autocomplete_endpoint') do
          render json: [] if params[:term].nil?
          render json: [] if options.nil?
          # if cacheable?
          #   items = Rails.cache.fetch(get_cache_key(options), expires_in: cache_expire) { get_items(options, params[:term]) }
          # elsle
          items = get_items(options, params)
          # end
          render json: items
        end
      end
    end

    def get_items(options, params)
      klasses = options.keys
      items = []
      for klass in klasses
        columns = options[klass].instance_of?(Array) ? options[klass] : [] << options[klass]
        items.concat(get_collection(klass, columns, term: params[:term], limit: get_limit(params)))
      end
      items
    end

    def get_limit(params)
      params[:limit] ||= 20
    end

    def cacheable?
      Rails.application.config.cache_store.present? && Rails.application.config.cache_autocomplete
    end

    def cache_expire
      Rails.application.config.autocomplete_cache_expire
    end

    def get_cache_key(options)
      BASE_CACHE_KEY + ':' + get_model_cache_key(options)
    end

    def get_model_cache_key(options)
      klasses = options.keys
      cache_key = ''
      klasses.each_with_index do |klass, index|
        cache_key.concat('_and_') if index > 0
        cache_key.concat(klass.to_s)
        columns = options[klass].instance_of?(Array) ? options[klass] : [] << options[klass]
        for column in columns
          cache_key.concat('_' + column.to_s)
        end
      end
      cache_key
    end
  end
end
