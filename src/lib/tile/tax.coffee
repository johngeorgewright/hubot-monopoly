Tile = require './tile'

class TaxTile extends Tile
  constructor: (@price) ->
    super 'Income Tax'
