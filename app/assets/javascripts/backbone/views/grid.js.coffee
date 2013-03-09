class FP.Views.Grid extends Backbone.View
  initialize: ->
    @$(".item img").on "load", (event) =>
      @resize()

    $(window).smartresize =>
      @resize()

    @$(".item").width(@columnWidth())
    @$el.isotope
      itemSelector: ".item"
      resizable: false
      masonry:
        gutterWidth: 18

  columnWidth: ->
    width = @$el.width()
    if width > 768
      numColumns = 3
    else if width > 480
      numColumns = 2
    else
      numColumns = 1

    numGutters = numColumns - 1
    (@$el.width() - (18 * numGutters)) / numColumns

  reset: ->
    @$el.isotope
      filter: ""

  filter: (id) ->
    @$el.isotope
      filter: ".#{id}"

  resize: ->
    $(".item").width @columnWidth()
    @$el.isotope
      masonry:
        columnWidth: @columnWidth()
