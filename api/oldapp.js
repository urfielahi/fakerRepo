// const express = require('express')

// var MongoClient = require('mongodb').MongoClient;
// var assert = require('assert');
// var ObjectId = require('mongodb').ObjectID;

// const app = express();


// var url = 'mongodb://localhost:27017/mongotest';
// var service = require('./services/user.service')


// //create Fake User call
// app.get('/create', (req, res) => {
//   User = service.createNewUser();
//   console.log("New User Created is : ")
//   console.log(User)

//   //Insert Call
//   insertedUser = MongoClient.connect(url, function(err, db) {
//       assert.equal(null, err);
//       service.insertUser(db, User, function() {
//         console.log("Inserted a document into the tests collection.");
//         console.log(insertedUser);
//         db.close();
//       });
//     });

// })

// app.get('/users', (req, res) => {
//   users = MongoClient.connect(url, function(err, db) {
//     assert.equal(null, err);
//     service.getUsers(db, function() {
//         db.close();
//     });
//    });
//    res.send(users);
// })





// // //Insert function call



// // //Select function
// // var findUsers = function(db, callback) {
// //   var cursor =db.collection('tests').find( );
// //   cursor.each(function(err, doc) {
// //      assert.equal(err, null);
// //      if (doc != null) {
// //         console.dir(doc);
// //      } else {
// //         callback();
// //      }
// //   });
// // };

// // //Call the findUsers function.

// // MongoClient.connect(url, function(err, db) {
// //  assert.equal(null, err);
// //  findUsers(db, function() {
// //      db.close();
// //  });
// // });

// app.listen(3000, () => console.log('Example app listening on port 3000!'))
