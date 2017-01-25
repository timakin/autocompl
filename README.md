Autocompl[WIP]
====

## Usage

```
gem 'autocompl'
```

application.js
```
//= require auto-complete
```

application.css
```
*= require auto-complete
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
  autocomplete product: [:name, :title], maker: :name
end
```
