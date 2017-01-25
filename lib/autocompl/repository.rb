module Autocompl
  module Repository
    def get_collection(model, columns)
      klass = model.to_s.camelize.constantize
      items = []
      for column in columns
        items.concat(klass.select(column).distinct.map(&column))
      end
      items
    end
  end
end
