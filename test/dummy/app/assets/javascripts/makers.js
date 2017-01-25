// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {
  new autoComplete({
      selector: 'input[name="maker_index_form"]',
      source: function(term, response){
          $.getJSON('/makers/autocomplete_endpoint', { term: term }, function(data){
            term = term.toLowerCase();
            var matches = [];
            for (i=0; i<data.length; i++)
              if (~data[i].toLowerCase().indexOf(term)) matches.push(data[i]);
            response(matches);
          });
      }
  });
});
