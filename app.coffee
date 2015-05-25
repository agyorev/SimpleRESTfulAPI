express = require 'express'

app = express()

app.set 'port', process.env.PORT or 3000

app.get '/', (req, res) ->
    res.send 'We are up and running!'

server = app.listen app.get('port'), ->
    console.log "Listening on port #{app.get('port')}."

