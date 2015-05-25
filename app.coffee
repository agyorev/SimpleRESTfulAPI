express    = require 'express'
mongoose   = require 'mongoose'
bodyParser = require 'body-parser'

app = express()

# set listening port
app.set 'port', process.env.PORT or 3000

# connect to the db, and make the schema available
app.set 'storage-uri',
    process.env.MONGOHQ_URL or
    process.env.MONGOLAB_URI or
    'mongodb://localhost/items'

# include bodyParser middleware that parses request body so the parameters
# passed in become available as req.body

# parse application/json
app.use bodyParser.json()

# parse application/x-www-form-urlencoded
app.use bodyParser.urlencoded({extended: false})

mongoose.connect app.get('storage-uri'),
    {db: {safe: true}},
    (err) ->
        console.log "Mongoose - connection error: " + err if err?
        console.log "Mongoose - connection OK"

require './model/item'

app.get '/', (req, res) ->
    res.send 'We are up and running!'

server = app.listen app.get('port'), ->
    console.log "Listening on port #{app.get('port')}"

