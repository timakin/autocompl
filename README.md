Autocompl
====

Autocompl is the light-weight library that provides an autocomplete function to Rails app.
This gem depends on Vanilla JavaScript, not jquery. (See the repo of [autoComplete](https://github.com/Pixabay/JavaScript-autoComplete))

## Installation

Include the gem on your Gemfile

```
gem 'autocompl'
```

Install it

```
bundle install
```

## Configuration

Add it to your app/assets/javascripts/application.js file

```
//= require autocompl
```

And, add it to your app/assets/stylesheets/application.css file

```
*= require autocompl
```

## Example

As an example, let's configure for embed an autocomplete to search `Product#name`.

At first, edit `routes.rb` to let your javascript to access to the database.
For an example, if you'd like to add an endpoint to `ProductsController`, write down this code.

```
resources :products do
  get "autocomplete_endpoint", on: :collection
end
```

After that, add this to `products_controller.rb`

```
class ProductsController < ApplicationController
  ...
  # This will define `autocomplete_endpoint` on ProductsController.
  autocomplete product: :name
  ...
end
```

Finally, write the JavaScript code and HTML to generate an autocomplete form.

```
# products.js
$(document).ready(function() {
  new autoComplete({
      selector: 'input[name="productSearch"]',
      source: function(term, response){
          $.getJSON('/products/autocomplete_endpoint', { term: term }, function(data){
            term = term.toLowerCase();
            var matches = [];
            for (i=0; i<data.length; i++)
              if (~data[i].toLowerCase().indexOf(term)) matches.push(data[i]);
            response(matches);
          });
      }
  });
});


# views/products/index.html.erb
...
<input autofocus type="text" name="productSearch" placeholder="Input a name of a product...">
...
```

In addition, if you'd search with product `maker` name, that was internationalized with `name_ja` and `name_en` columns,
rewrite your `products_controller.rb` like this.

```
class ProductsController < ApplicationController
  ...
  autocomplete product: :name, maker: [:name_ja, :name_en]
  ...
end
```
