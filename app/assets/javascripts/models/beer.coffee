App.factory "Beer", ['railsResourceFactory', 'railsSerializer', (railsResourceFactory, railsSerializer) ->
  resource = railsResourceFactory
    url: "/beers"
    name: "beer"
    serializer: railsSerializer ->
      @nestedAttribute 'brewery'
]
