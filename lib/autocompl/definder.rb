module Autocompl
    module Definder
        def self.included(target)
            target.extend Autocompl::Definder::ClassMethods
            target.send :include, Autocompl::Repository
        end

        module ClassMethods
            def autocomplete(options = {})
                define_method('autocomplete_endpoint') do
                    method = options[:column_name] if options.key?(:column_name)

                    term = params[:term]

                    if term && !term.blank?
                        # allow specifying fully qualified class name for model object
                        class_name = options[:class_name] || object
                        items = get_autocomplete_items(model: get_object(class_name), \
                                                       options: options, term: term, method: method)
                    else
                        items = {}
                    end

                    render json: json_for_autocomplete(items, options[:display_value] ||= method, options[:extra_data])
                end
            end
        end
    end
end
