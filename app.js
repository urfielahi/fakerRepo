const express = require('express')
const faker = require('faker')

//Mongo Connection
var MongoClient = require('mongodb').MongoClient;
var assert = require('assert');
var ObjectId = require('mongodb').ObjectID;
const url = 'mongodb://localhost:27017/mongotest';

const app = express();

//Select function
var findUsers = function(db, callback) {
  var cursor =db.collection('tests').find( );
  cursor.each(function(err, doc) {
     assert.equal(err, null);
     if (doc != null) {
        console.dir(doc);
     } else {
        callback();
     }
  });
};//select close


//Create  function
createNewUser = function(){
    var User = {
                name: faker.name.findName(),
                email: faker.internet.email(),
                website: faker.internet.url(),
                address: faker.address.streetAddress() + faker.address.city() + faker.address.country(),
                bio: faker.lorem.sentences(),
                image: faker.image.avatar()
        
            }
    console.log("User Created!!");
  
    //Insert function
    MongoClient.connect(url, function(err, db) {
      assert.equal(null, err);
      db.collection('tests').insertOne( User, function(err, result) {
        assert.equal(err, null);
        console.log("Inserted a document into the tests collection.");
        db.close();
      });
    });//insert close

}//create close


//Create Route
app.get('/create', (req,res) => {
   for(var i=1; i<=20; i++)
   {
    createNewUser();
   }
})

//select Route
app.get('/users', (req, res) => {
  MongoClient.connect(url, function(err, db) {
 assert.equal(null, err);
 findUsers(db, function() {
     db.close();
 });
});
})


app.listen(3000, () => console.log('Example app listening on port 3000!'))
