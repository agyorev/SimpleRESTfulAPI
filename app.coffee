http       = require 'http'
express    = require 'express'
mongoose   = require 'mongoose'
bodyParser = require 'body-parser'

items = require './controller/items'

app = express()

# set listening port
app.set 'port', process.env.PORT or 3000

# connect to the db, and make the schema available
app.set 'storage-uri',
    process.env.MONGOLAB_URI or
    process.env.MONGOHQ_URL or
    'mongodb://localhost/items'

# include bodyParser middleware that parses request body so the parameters
# passed in become available as req.body

# parse application/json
app.use bodyParser.json()

mongoose.connect app.get('storage-uri'), (err) ->
    if err?
        console.log "Mongoose - connection error: " + err
    else
        console.log "Mongoose - connection OK"

require './model/item'

app.get '/', (req, res) ->
    res.send 'We are up and running!'

# specify all necessary routes with their respective operations
app.post     '/items',       items.create
app.get      '/items',       items.retrieve
app.get      '/items/:id',   items.retrieve
app.put      '/items/:id',   items.update
app.delete   '/items/:id',   items.delete

server = app.listen app.get('port'), ->
    console.log "Listening on port #{app.get('port')}"

