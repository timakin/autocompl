// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
  new autoComplete({
      selector: 'input[name="q"]',
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
