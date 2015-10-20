Tile = require './tile'
cummunityChest = require '../card/community-chest'

class CommunityChestTile extends Tile
  constructor: ->
    super 'Community Chest'

  onLand: ->
    card = communityChest.pick()
    card.action()

module.exports = CommunityChestTile
