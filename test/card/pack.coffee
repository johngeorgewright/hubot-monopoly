CardPack = require '../../src/lib/card/pack'
{expect} = require 'chai'

describe 'CardPack', ->
  beforeEach ->
    @pack = new CardPack

  describe 'constructor()', ->
    it 'will add an empty array of cards', ->
      expect(@pack.cards).to.eql []

    it 'can take an array of cards during construction', ->
      pack = new CardPack [1, 2, 3]
      expect(pack.cards).to.eql [1, 2, 3]

  describe 'put()', ->
    it 'will add cards to the beginning of the pack', ->
      @pack.put 4
      @pack.put 3
      expect(@pack.cards).to.eql [3, 4]

  describe 'size()', ->
    it 'will return the size of the pack', ->
      expect(@pack.size()).to.equal 0
      @pack.put 1, 2
      expect(@pack.size()).to.equal 2

  describe 'take()', ->
    beforeEach ->
      @pack.put 2, 3, 4, 5

    it 'will remove an item from the pack', ->
      @pack.take()
      expect(@pack.size()).to.equal 3

    it 'will return the card removed from the card', ->
      expect(@pack.take()).to.equal 5

  describe 'shuffle()', ->
    beforeEach ->
      @pack.put 1, 2, 3, 4, 5, 6, 7, 8, 9

    it '"should" shuffle the pack', ->
      @pack.shuffle()
      expect(@pack.size()).to.equal 9
      expect(@pack.cards).to.include.members [1, 2, 3, 4, 5, 6, 7, 8, 9]
      expect(@pack.cards).not.to.eql [1, 2, 3, 4, 5, 6, 7, 8, 9]
