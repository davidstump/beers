@App = angular.module("beers", [
  'rails'
])

@App.config ["$httpProvider", ($httpProvider) ->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]

$(document).on "ready", ->
  angular.bootstrap(document, ["beers"])
  $(document).foundation()
