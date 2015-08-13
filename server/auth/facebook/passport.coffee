'use strict'

passport = require('passport')
FacebookStrategy = require('passport-facebook').Strategy

exports.setup = (User, config) ->
  passport.use new FacebookStrategy({
    clientID: config.facebook.clientID
    clientSecret: config.facebook.clientSecret
    callbackURL: config.facebook.callbackURL
  }, (accessToken, refreshToken, profile, done) ->
    User.findOne { 'facebook.id': profile.id }, (err, user) ->
      if err
        return done(err)
      if !user
        console.log '>>> FB profile'

        console.log profile
        console.log '>>> // FB profile'
        console.log ''
        user = new User(
          name: profile.displayName
          email: profile.emails[0].value
          role: 'user'
          username: profile.username
          provider: 'facebook'
          facebook: profile._json
        )
        user.save (err) ->
          if err
            return done(err)
          done err, user
          return
      else
        return done(err, user)
      return
    return
  )
  return