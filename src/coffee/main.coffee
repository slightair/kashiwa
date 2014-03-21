App = require './app'

$ ->
  app = App.getInstance()

  app.attachTo '#world-view'
  app.run()

  $("#tick-button").click ->
    app.tick() unless app.started()

  $("#auto-check").click ->
    if !app.started()
      app.start()
    else
      app.stop()
