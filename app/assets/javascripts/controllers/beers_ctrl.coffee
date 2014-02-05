class BeersCtrl extends @NGController
  @register window.App

  @$inject: [
    '$scope',
    'Beer'
  ]

  init: ->
    @showForm = false
    @loadBeers()

  loadBeers: ->
    @Beer.query().then (results) =>
      @all = results

  addBeer: ->
    new @Beer(@newBeer).create().then (results) =>
      @loadBeers()

  destroy: (beer_id) ->
    @Beer.$delete(@Beer.resourceUrl(beer_id)).then (results) =>
      @loadBeers()

