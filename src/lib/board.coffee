GoTile = require './tile/go'
StreetTile = require './tile/street'
CommunityChestTile = require './tile/community-chest'
ChanceTile = require './tile/chance'
TaxTile = require './tile/tax'
StationTile = require './tile/station'
JailTile = require './tile/jail'
UtilityTile = require './tile/utility'
FreeParkingTile = require './tile/free-parking'

TILES = [
  new GoTile
  new StreetTile 'Old Kent Road', 'brown', 60
  new CommunityChestTile
  new StreetTile 'Whitechapel Road', 'brown', 60
  new TaxTile 200
  new StationTile 'Kings Cross Station', 200
  new StreetTile 'The Angel, Islington', 'light blue', 120
  new ChanceTile
  new StreetTile 'Euston Road', 'light blue', 100
  new StreetTile 'Pentonville Road', 'light blue', 120
  new JailTile
  new StreetTile 'Pall Mall', 'pink', 140
  new UtilityTile 'Electrical Company', 150
  new StreetTile 'Whitehall', 'pink', 140
  new StreetTile 'Northumberland Avenue', 'pink', 160
  new StationTile 'Marylebone Station', 200
  new StreetTile 'Bow Street', 'orange', 180
  new CommunityChestTile
  new StreetTile 'Marlborough Street', 'orange', 180
  new StreetTile 'Vine Street', 'orange', 200
  new FreeParkingTile
  new StreetTile 'Strand', 'red', 220
  new StreetTile 'Fleet Street', 'red', 220
  new StreetTile 'Trafalgar Square', 'red', 240
  new StationTile 'Fenchurch Street Station', 200
  new StreetTile 'Leicester Square', 'yellow', 260
  new StreetTile 'Coventry Street', 'yellow', 260
  new UtilityTile 'Water Works', 150
  new StreetTile 'Picadilly', 'yellow', 280
]
