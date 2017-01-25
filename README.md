Autocompl[WIP]
====

## Usage

```
gem 'autocompl'
```

application.js
```
//= require autocompl
```

application.css
```
*= require autocompl
```

routes
```
resources :products do
  get "autocomplete_endpoint", on: :collection
end
```

products_controller.rb
```
class ProductsController < ApplicationController
  # This will define `autocomplete_endpoint` to ProductsController.
  autocomplete product: :name, maker: [:name_ja, :name_en]
end
```
