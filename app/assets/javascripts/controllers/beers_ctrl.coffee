class BeersCtrl extends @NGController
  @register window.App

  @$inject: [
    '$scope',
    'Beer'
  ]

  init: ->
    @loadBeers()

  loadBeers: ->
    @Beer.query().then (results) =>
      @all = results

  create: ->
    new @Beer(@newBeer).create().then (results) =>
      @loadBeers()

  destroy: (beer_id) ->
    @Beer.$delete(@Beer.resourceUrl(beer_id)).then (results) =>
      @loadBeers()

