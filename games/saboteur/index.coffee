'use strict'

App = require('./app')

module.exports =
  hidden: false
  author: 'mygenie3@naver.com'
  name: '사보타지'
  # image: 'view/assets/saboteur-plus.PNG'
  template: 'view/saboteur.controller.html'
  controller: 'GameSaboteurController'
  options: {
    desc: '게임 준.비.완료~! Rangers-town의 오리지날 샘플 게임! 누가 가장 빨리 덧셈을 할까요? 팀원들과 경쟁해볼까요?'    
  }
  factory: (socket, roomAPI, resource) ->

    numbers = new App.Saboteur(socket)

    instance =
      onenter: (client) ->
        player = numbers.enter client
        console.log '>>> return check'
        console.log player
        console.log '>>> prototype'
        console.log player.prototype
        for key, value of player
          if typeof value is 'function'
            console.log '>>> ' + key
        player
      
      
      onleave: (client) ->
        numbers.leave client
        return    

    instance