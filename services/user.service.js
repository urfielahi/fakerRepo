// // Gettign the Newly created Mongoose Model we just created 

// const faker = require('faker')
// var MongoClient = require('mongodb').MongoClient;
// var assert = require('assert');
// var ObjectId = require('mongodb').ObjectID;
// var url = 'mongodb://localhost:27017/mongotest';

// // Saving the context of this module inside the _the variable
// //_this = this

// // Async function to get the User List
// exports.getUsers = async  function(db, callback) {
//   var cursor =db.collection('tests').find( );
//   cursor.each(function(err, doc) {
//      assert.equal(err, null);
//      if (doc != null) {
//         console.dir(doc);
//      } else {
//         callback();
//      }
//   });
// };


// exports.createNewUser = async function(){
//     User = {
//         name: faker.name.findName(),
//         email: faker.internet.email(),
//         website: faker.internet.url(),
//         address: faker.address.streetAddress() + faker.address.city() + faker.address.country(),
//         bio: faker.lorem.sentences(),
//         image: faker.image.avatar()
      
//       }
//     return User;
// }

// exports.insertUser =  async function(db, User, callback) {
//     console.log(User);
//   db.getCollection('tests').insertOne( User, function(err, res) {
//    assert.equal(err, null);
//    callback();
//  });

// };

// // exports.createTest = async function(test){
    
// //     // Creating a new Mongoose Object by using the new keyword
// //     var newTest = new Test({
// //         title: test.title,
// //         description: test.description,
// //         date: new Date(),
// //         status: test.status
// //     })

// //     try{

// //         // Saving the Test 
// //         var savedTest = await newTest.save()

// //         return savedTest;
// //     }catch(e){
      
// //         // return a Error message describing the reason     
// //         throw Error("Error while Creating Test")
// //     }
// // }

// // exports.updateTest = async function(test){
// //     var id = test.id

// //     try{
// //         //Find the old Test Object by the Id
    
// //         var oldTest = await Test.findById(id);
// //     }catch(e){
// //         throw Error("Error occured while Finding the Test")
// //     }

// //     // If no old Test Object exists return false
// //     if(!oldTest){
// //         return false;
// //     }

// //     console.log(oldTest)

// //     //Edit the Test Object
// //     oldTest.title = test.title
// //     oldTest.description = test.description
// //     oldTest.status = test.status


// //     console.log(oldTest)

// //     try{
// //         var savedTest = await oldTest.save()
// //         return savedTest;
// //     }catch(e){
// //         throw Error("And Error occured while updating the Test");
// //     }
// // }

// // exports.deleteTest = async function(id){
    
// //     // Delete the Test
// //     try{
// //         var deleted = await Test.remove({_id: id})
// //         if(deleted.result.n === 0){
// //             throw Error("Test Could not be deleted")
// //         }
// //         return deleted
// //     }catch(e){
// //         throw Error("Error Occured while Deleting the Test")
// //     }
// // }