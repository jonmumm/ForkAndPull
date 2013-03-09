class FP.Views.GridItem extends Backbone.View
  initialize: ->
    @model.on "reset", @onReset, @

  load: ->
    console.log "show loading view"

  onReset: (model) ->
    console.log "REST!"

