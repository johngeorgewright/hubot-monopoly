Tile = require './tile'

class Street extends Tile
  constructor: (label, @color, @price, @deed) ->
    super label
    @property = []

module.exports = Street
