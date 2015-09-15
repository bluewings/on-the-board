App = require('../app')

should = require('should')

# socketMock = 
#   emit: (eventName, message) ->
#     return
#   emitTo: (receivers, eventName, message) ->
#     return
#   on: (eventName, callback) ->
#     return

clientMock = {} 

NUMBER_OF_PIECES = 14


describe "'Number Chess' test suite", ->

  numberChess = null

  before ->
    numberChess = null
    numberChess = new App.NumberChess()
    return

  after ->
    # describe "'Number Chess' after", ->
      
    #   it 'create a new game1', ->
    #     console.log 'before job'
    #     numberChess = new App.NumberChess()
    return


  describe "'Number Chess' test suite", ->

    it 'player entered', ->
      numberChess.enter {}
      numberChess.players.length.should.equal(1)
      numberChess.enter {}
      numberChess.players.length.should.equal(2)

    it 'start new game', ->
      numberChess.start()
      for player in numberChess.players
        player.items.pieces.length.should.equal(NUMBER_OF_PIECES)

    it 'setup chessboard', ->

      # game.addPlayer new Player()
      # game.properties.players.length.should.equal(1)

    # it 'leave a player', -> 

      # game.addPlayer new Player()
      # game.properties.players.length.should.equal(1)