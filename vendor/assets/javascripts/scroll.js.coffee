window.Scroll = (element, time = 500, offset = 0) ->
  $('html, body').animate({
    scrollTop: ($(element).offset().top - offset)
  }, time);
