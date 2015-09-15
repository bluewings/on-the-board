'use strict'



App = {}

class App.NumberChess
  constructor: (@socket, @roomAPI, @resource) ->
    @reset()
    return

  reset: ->
    @chessboard = new App.Chessboard()


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



class App.Pieces
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

    @pieces = new App.Pieces()
    console.log @pieces

    return

angular.module 'rangers'
.directive 'numberChess', ->
  restrict: 'E'
  replace: true
  templateUrl: 'app/directives/number-chess.directive.html'
  scope: true
  bindToController: true
  controllerAs: 'vm'
  controller: ($scope, $element, $timeout, resource) ->
    vm = @
    vm.a = []
    vm.size = 60
    vm.numberChess = new App.NumberChess()


    vm.a = vm.numberChess.chessboard.adjacentSquares(1, 1)

    vm.player1 = new App.Player()
    vm.player2 = new App.Player()


    return