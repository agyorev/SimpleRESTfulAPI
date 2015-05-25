mongoose = require 'mongoose'

# create a new item
exports.create = (req, res) ->
    Resource = mongoose.model('Item')
    fields = req.body

    r = new Resource(fields)
    r.save (err, resource) ->
        if err?
            res.sendStatus(500, {error: err})
        else
            res.sendStatus(resource)

# receive the data for all or for a specific item
exports.retrieve = (req, res) ->
    Resource = mongoose.model('Item')

    if req.params.id?
        Resource.findById req.params.id, (err, resource) ->
            if err?
                res.sendStatus(500, {error: err})
            else if resource?
                res.sendStatus(resource)
            else
                res.sendStatus(404)
    else
        Resource.find {}, (err, coll) ->
            if err?
                res.sendStatus(500, {error: err})
            else
                res.sendStatus(coll)

# update the data for a specific item
exports.update = (req, res) ->
    Resource = mongoose.model('Item')
    fields = req.body

    Resource.findByIdAndUpdate req.params.id, {$set: fields}, (err, resource) ->
        if err?
            res.sendStatus(500, {error: err})
        else if resource?
            res.sendStatus(resource)
        else
            res.sendStatus(404)

# delete an item
exports.delete = (req, res) ->
    Resource = mongoose.model('Item')

    Resource.findByIdAndRemove req.params.id, (err, resource) ->
        if err?
            res.sendStatus(500, {error: err})
        else if resource?
            res.sendStatus(200)
        else
            res.sendStatus(404)
