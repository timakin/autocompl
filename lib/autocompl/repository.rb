module Autocompl
  module Repository
    def get_collection(model, columns, options)
      klass = model.to_s.camelize.constantize
      items = []
      for column in columns
        items.concat(klass.select(column).where("#{column} LIKE ?", "%#{options[:term]}%").limit(options[:limit]).distinct.map(&column))
      end
      items
    end
  end
end
