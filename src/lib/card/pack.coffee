class CardPack
  constructor: (@cards) ->

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
    card = @cards.pop()
    card

  put: (card) ->
    @cards.unshift card
