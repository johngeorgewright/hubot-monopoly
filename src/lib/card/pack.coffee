class CardPack
  constructor: (@cards = []) ->

  shuffle: ->
    counter = @cards.length
    while counter > 0
      index = Math.floor Math.random() * counter
      counter--
      temp = @cards[counter]
      @cards[counter] = @cards[index]
      @cards[index] = temp
    @cards

  take: ->
    @cards.pop()

  put: ->
    @cards.unshift.apply @cards, arguments

  size: ->
    @cards.length

module.exports = CardPack
