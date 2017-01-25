module Autocompl
    module Repository
        def get_autocomplete_items(parameters)
            model = parameters[:model]
            table_name = parameters[:table_name]
            term    = parameters[:term]
            method  = parameters[:method]
            options = parameters[:options]
            scopes  = Array(options[:scopes])
            where   = options[:where]
            limit   = get_autocomplete_limit(options)
            order   = get_autocomplete_order(method, options, model)

            items = model.all

            scopes.each { |scope| items = items.send(scope) } unless scopes.empty?

            items = items.select(get_autocomplete_select_clause(model, method, options)) unless options[:full_model]
            items = items.where(get_autocomplete_where_clause(model, term, method, options))
                         .limit(limit).order(order)
            items = items.where(where) unless where.blank?

            items.to_a
        end
    end
end
