#### A basic RESTful API using Express, Mongoose and CoffeeScript

Implementing sample CRUD (crate, read, update, delete) operations.

##### Install
`$> npm install`

##### Run MongoDB

    $> mkdir items
    $> cd items
    $> mongod --dbpath .

##### Run the server
`$> npm start`


Now that we have a server running on `localhost:3000` we can make some requests.

##### Create an item

    $> curl -X POST -H 'Content-Type: application/json' \
      -d '{"name": "Item 1", "desc": "This is the first item.", "amount": "4"}' \
      localhost:3000/items


##### Get all items

    $> curl localhost:3000/items


##### Get a specific item

    $> curl localhost:3000/items/<item _id here>


##### Update an item

    $> curl -X PUT -H 'Content-Type: application/json' \
      -d '{ "name": "New item name" }' \
      localhost:3000/items/55635c38735bb3121a59ccc5


##### Delete an item

    $> curl -X DELETE localhost:3000/items/55635c38735bb3121a59ccc5
