String::toCamel = ->
  @replace /(\-[a-z])/g, ($1) ->
    $1.substring(0, 1).toLowerCase() + $1.substring(0)

class @NGObject
  constructor: (dependencies...) ->
    for dependency, index in @constructor.$inject
      @[dependency.replace('$', '')] = dependencies[index]
    @init?()

class @NGController extends @NGObject
  @register: (app) ->
    app.controller "#{@name}", this

  constructor: (@scope) ->
    @scope[key] = value for key, value of this when !@scope[key]?
    super

class @NGService extends @NGObject
  @register: (app) -> app.service "#{@name}", this

  observableCallbacks: {}

  on: (event_name, callback) ->
    @observableCallbacks[event_name] ?= []
    @observableCallbacks[event_name].push callback

  notify: (event_name, data = {}) ->
    angular.forEach @observableCallbacks[event_name], (callback) ->
      callback(data)

class @NGDirective extends @NGObject
  @register: (app) ->
    name = @name.substring(0, 1).toLowerCase() + @name.substring(1)
    app.directive "#{name}", this.prototype.constructor.options

  @options: =>
    restrict: 'AE'
    @init?()

class @NGAttribute extends @NGDirective
  @options: ->
    restrict: 'A'
    super

class @NGElement extends @NGDirective
  @options: ->
    restrict: 'E'
    super
