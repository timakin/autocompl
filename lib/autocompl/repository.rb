module Autocompl
  module Repository
    def get_collection(model, columns, options)
      klass = model.to_s.camelize.constantize
      items = []
      for column in columns
        items.concat(klass.select(column).where("#{column} #{like_clause(klass)} ?", "%#{options[:term]}%").limit(options[:limit]).distinct.map(&column))
      end
      items
    end

    private

    def like_clause(model)
      postgres?(model) ? 'ILIKE' : 'LIKE'
    end

    def postgres?(model)
      model.connection.class.to_s.match(/PostgreSQLAdapter/)
    end
  end
end
