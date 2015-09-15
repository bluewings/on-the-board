'use strict'

App = {}

class App.NumberChess
  constructor: (@socket, @roomAPI, @resource) ->
    @players = []
    @reset()


  reset: ->
    @chessboard = new App.Chessboard()
    return

  start: ->
    @reset()



  syncdata: ->
    return

  enter: (client) ->
    player = new App.Player(client)
    @players.push player
    @syncdata()
    return

  leave: (client) ->
    for player, i in @players
      if player.client.id is client.id
        @players.splice i, 1
        @syncdata()
        return
    return

  setItems: ->


    return


class App.Square
  constructor: (@row, @col) ->
    @piece = null

  

  




class App.Chessboard
  constructor: ->
    @squares = []
    @reset()

  adjacentSquares: (row, col) ->
    if typeof row is 'object'
      square = row
    else
      square = row: row, col: col
    squares = []
    for each in @squares
      if Math.pow(each.row - square.row, 2) + Math.pow(each.col - square.col, 2) is 1
        squares.push each
    squares







  reset: ->
    # @rows = []
    @squares = []
    for i in [1..9]
      for j in [1..6]
        @squares.push new App.Square(i, j)
    # @cells = 
    # for i in [1...9]
    #   row = 
    return



class App.Items
  constructor: ->
    @reset()

  reset: ->
    @pieces = []
    for i in [1..10]
      @pieces.push new App.Piece(i)
    for i in [0...3]
      @pieces.push new App.Piece('bomb')
    @pieces.push new App.Piece('king')
    @shuffle()
    return



  shuffle: (array) ->
    pieces = @pieces
    counter = pieces.length
    while counter > 0
      index = Math.floor(Math.random() * counter)
      counter--
      temp = pieces[counter]
      pieces[counter] = pieces[index]
      pieces[index] = temp
    return

class App.Piece
  constructor: (@value) ->
    @hidden = true

    return

class App.Player
  constructor: ->
    # @pieces = []
    @reset()


  reset: ->

    @items = new App.Items()
    # console.log @pieces

    return

module.exports = App
