class FP.Views.Video extends Backbone.View
  initialize: ->
    $(window).smartresize =>
      @resize()

    @render()

  resize: ->
    width = @$(".video").width()
    @$(".video").height(width * 9 / 16)

  render: ->
    script = "<script src='#{@model.get("gist_url")}'></script>"
    injector = new Injector { container: @$(".more").get(0) }
    injector.insert script

    setTimeout =>
      @resize()
    , 0
