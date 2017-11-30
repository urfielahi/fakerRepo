const express = require('express');
const faker = require('faker');
const Chance = require('chance');
const app = express();
const chance = new Chance();
const bunyan = require('bunyan');
const cuid = require('cuid');
const log = bunyan.createLogger({name: 'play', level: 'debug'});
const portNumber = 3000;

//------------------------------------------------------------------
//  @BUNYAN LOGS Simple Example. For complex examples refere to docs
//---------------------------------------------------------------------

log.trace('this one does not emit');
log.debug('hi on debug');   // console.log 
log.info('hi on info');     // console.info 
log.warn('hi on warn');     // console.warn 
log.error('hi on error');   // console.error 

//------------------------------------------------------------------
//  @MYSQL DB
//---------------------------------------------------------------------

var mysql      = require('mysql');
var connection = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : '',
    database : 'flib'
});
   
    
connection.connect(function(err){
    if(!err) {
        console.log("Database is connected");    
    } else {
        console.log("Error connecting database");    
    }
});
    
// connection.query('SELECT * FROM passenger', (err,rows) => {
//     if(err) throw err;
  
//     console.log('Data received from Db:\n');
//     rows.forEach( (row) => { 
//         console.log(`${row.name}`); 
//     });
// });

for(var i = 0; i < 100; i++){
    var passenger = {
        p_uuid : cuid(),
        name: faker.name.findName(),
        phone_num: faker.phone.phoneNumberFormat(), 
        card_num: chance.cc({type: chance.cc_type()}),
        card_exp_date: chance.exp_year() + "-" + chance.exp_month()  +  "-01"  
    };

    connection.query('INSERT INTO passenger SET ?', passenger, (err, res) => {
    if(err) throw err;  
    console.log('Last insert ID:', res.insertId);
    });
}
  







//------------------------------------------------------------------------
// ************  @MONGODB   *****************
//------------------------------------------------------------------------
//Mongo Connection
// var MongoClient = require('mongodb').MongoClient;
// var assert = require('assert');
// var ObjectId = require('mongodb').ObjectID;
// const url= 'mongodb://localhost:27017/mongotest';


// //Select function
// var findUsers = function(db, callback) {
//   var cursor =db.collection('tests').find( );
//   cursor.each(function(err, doc) {
//      assert.equal(err, null);
//      if (doc != null) {
//         console.dir(doc);
//      } else {
//         callback();
//      }
//   });
// };//select close


// app.all('/', (req, res) => {
//     res.send("Hello");
// });

// //Create Route
// app.get('/create', (req,res) => {
//     //return res.send(result);
    
//          //Insert function
//         MongoClient.connect(url, function(err, db) {
//             assert.equal(null, err);
//             for(var i=1; i<=20; i++){
//                 var User = {
//                     passenger_id: faker.uuid(),
//                     fname: faker.name.firstName(),
//                     lname: faker.name.lastName(),
//                     email: faker.internet.email(),
//                     website: faker.internet.url(),
//                     address: {
//                       street: faker.address.streetAddress(),
//                       city: faker.address.city(),
//                       country: faker.address.country() 
//                     },
//                     bio: faker.lorem.sentences(),
//                     image: faker.image.avatar()
//                 };
//                 db.collection('tests').insertOne( User, function(err, result) {
//                     assert.equal(err, null);
//                     console.log("Inserted a document into the tests collection.");
//                 });
//             }
//             db.close();
//         });//insert close
// });
    

// //select Route
// app.get('/users', (req, res) => {
//     MongoClient.connect(url, function(err, db) {
//         assert.equal(null, err);
//         findUsers(db, function() {
//             db.close();
//         });
//     });
// })

//-----------------------------------------------------------------------
// MONGODB CLOSE
//---------------------------------------------------------------------------





app.listen(portNumber, () => console.log(`Example app listening on port ${portNumber}!`));