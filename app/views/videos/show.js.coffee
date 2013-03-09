$(".notice").slideUp 200, ->
  $(@).remove()
$(".show").html "<%= escape_javascript(render 'video') %>"
$(".show").slideDown(500)
