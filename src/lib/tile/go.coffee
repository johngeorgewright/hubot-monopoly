Tile = require './Tile'

class GoTile extends Tile
  constructor: ->
    super 'GO! Collect £200 salary as you pass'

  onPass: (user) ->
    user.money += 200

module.exports = GoTile
