Tile = require './tile';

class UtilityTile extends Tile
  constructor: (label, @cost, @deed) ->
    super label
