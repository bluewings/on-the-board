'use strict'

# Development specific configuration
# ==================================
module.exports =

  # MongoDB connection options
  mongo:
    # uri: 'mongodb://10.113.187.9/rangers-mighty-dev'
    uri: 'mongodb://ds043348.mongolab.com:43348/bluewings'
    options:
      user: 'skywalker'
      pass: 'chasw97'

  seedDB: true
