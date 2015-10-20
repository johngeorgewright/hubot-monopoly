Tile = require './tile'

class TaxTile extends Tile
  constructor: (@price) ->
    super 'Income Tax'

  onLand: (user) ->
    user.money -= @price

module.exports = TaxTile
