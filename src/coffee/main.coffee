App = require './app'

$ ->
  app = new App('#world-view', 512, 384)
  app.run()