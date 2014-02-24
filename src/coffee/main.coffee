App = require './app'

$ ->
  app = App.getInstance()

  app.attachTo '#world-view'
  app.run()