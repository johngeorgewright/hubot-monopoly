Tile = require './tile'

class StationTile extends Tile
  constructor: (label, @cost, @deed) ->
    super label
