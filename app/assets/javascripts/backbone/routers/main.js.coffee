class FP.Routers.Main extends Backbone.Router
  initialize: ->
    fp.views.grid = new FP.Views.Grid
      el: $(".items")

    $(document).on "click", "a[href^='/']", (event) =>
      href = $(event.currentTarget).attr('href')

      # Check if the link matches our route
      passThrough = href.indexOf('/videos/') != 0 and href.indexOf('/categories/') != 0 and href != "/"

      # Allow shift+click for new tabs, etc.
      if !passThrough && !event.altKey && !event.ctrlKey && !event.metaKey && !event.shiftKey
        event.preventDefault()

        # Remove leading slashes and hash bangs (backward compatablility)
        url = href.replace(/^\//,'').replace('\#\!\/','')

        # Instruct Backbone to trigger routing events
        @navigate url, { trigger: true }

        event.preventDefault()

  routes:
    "": "root"
    "videos/:id": "videos"
    "categories/:id": "categories"

  root: ->
    @clear ->
      fp.views.grid.reset()
    , ".navigation", 800

  categories: (id) ->
    @clear ->
      fp.views.grid.filter id
    , ".navigation", 800

  videos: (id) ->
    @clear ->
      $loader = $("<div class='notice'> #{JST["backbone/templates/loader"]()} </div>")
      $loader.hide()
      $(".main .container").prepend $loader
      $loader.slideDown()

      model = new FP.Models.Video { id: id }
      model.fetch
        dataType: "script"
        success: (model) ->

  clear: (callback, scrollTo = ".main", timeout = 400) ->
    if $(".show .content").length > 0
      Scroll scrollTo, timeout
      $(".show").slideUp timeout, =>
        $(".show .content").remove()

      setTimeout =>
        callback.call @
      , timeout + 50
    else
      callback.call @

