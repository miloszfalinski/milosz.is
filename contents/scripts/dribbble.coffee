(($, window, document, undefined_) ->
  "use strict"
  $.dribbble = {}
  jsonpGET = (path, args) ->
    $.ajax
      type: "GET"
      url: "http://api.dribbble.com" + path
      data: args[1] or {}
      dataType: "jsonp"
      success: (data) ->
        if typeof (data) is "undefined"
          args[0] error: true
        else
          args[0] data


  methods =
    getShotById: "/shots/$/"
    getReboundsOfShot: "/shots/$/rebounds/"
    getShotsByList: "/shots/$/"
    getShotsByPlayerId: "/players/$/shots/"
    getShotsThatPlayerFollows: "/players/$/shots/following/"
    getPlayerById: "/players/$/"
    getPlayerFollowers: "/players/$/followers/"
    getPlayerFollowing: "/players/$/following/"
    getPlayerDraftees: "/players/$/draftees/"
    getCommentsOfShot: "/shots/$/comments/"
    getShotsThatPlayerLikes: "/players/$/shots/likes/"

  createAPIMethod = (urlPattern) ->
    ->
      # Convert arguments to a real Array
      args = [].slice.call(arguments)

      # We run shift() on args here because we don't need to send
      # the first argument to jsonpGET.
      url = urlPattern.replace("$", args.shift())
      jsonpGET url, args

  for method of methods
    $.dribbble[method] = createAPIMethod(methods[method])
) Zepto, window, document