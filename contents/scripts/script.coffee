Zepto ($) ->
  
  # Get Dribbble shots
  callback = (playerShots) ->
    html = ""
    # $("h2 b").text playerShots.shots[0].player.name
    $.each playerShots.shots, (i, shot) ->
      html += "<img src=\"" + shot.image_url + "\" "
      html += "alt=\"" + shot.title + "\">"
    $("#dribbble-shots").html html
  
  $.dribbble.getShotsByPlayerId "milosz", callback,
    page: 1
    per_page: 5
  