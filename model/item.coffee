mongoose = require 'mongoose'

Item = new mongoose.Schema(
    name: {
        type: String,
        trim: true
    }
    desc: String
    amount: {
        type: Number,
        min: 0
    }
    created: {
        type: Date,
        default: Date.now
    }
)

mongoose.model "Item", Item
