class Tile
  constructor: (@label) ->
    
  action: ->
    throw new Error "The #{@constructor.name} tile has not yet been assigned an
                     action"
