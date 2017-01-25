module Autocompl
    module Repository
        def get_collection(model, columns)
            klass = model.to_s.camelize.constantize
            records = []
            for column in columns
                records.concat(klass.select(column).distinct.map(&column))
            end
            records
        end
    end
end
