const express = require('express');
const faker = require('faker');
const Chance = require('chance');
const app = express();
const chance = new Chance();
const bunyan = require('bunyan');
const cuid = require('cuid');
const log = bunyan.createLogger({name: 'play', level: 'debug'});
const portNumber = 5620;
const now = require('performance-now');
const moment = require('moment');
const base62 = require('base62');
//const sync = require('synchronize');
base62.setCharacterSet("0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz");
require('dotenv').config();

var sync = require('synchronize');
var fiber = sync.fiber;
var await = sync.await;
var defer = sync.defer;

//Redis connection
// const redis = require('redis');
// //Redis client specified port and host
// const client = redis.createClient('6379', '127.0.0.1');

// //On connect event raised
// client.on('connect', function(){
//     console.log('connected!');
// });

// //Example to set key-value
// client.set('framework', 'AngularJS', function(err, reply){
//     console.log(reply);
// });

// //Example to get Value based on Key
// client.get('framework', function(err, reply){
//     console.log(reply);
// });

//console.log(client.get('framework'));

//------------------------------------------------------------------
//  @BUNYAN LOGS Simple Example. For complex examples refere to docs
//---------------------------------------------------------------------

// log.trace('this one does not emit');
// log.debug('hi on debug');   // console.log 
// log.info('hi on info');     // console.info 
// log.warn('hi on warn');     // console.warn 
// log.error('hi on error');   // console.error 

//------------------------------------------------------------------
//  @MYSQL DB
//---------------------------------------------------------------------

var mysql      = require('mysql');
var connection = mysql.createConnection({
    host     : process.env.DB_HOST,
    user     : process.env.DB_USERNAME,
    password : process.env.DB_PASSWORD,
    database : process.env.DB_DATABASE,
});
   
    
connection.connect(function(err){
    if(!err) {
        console.log("Database is connected");    
    } else {
        console.error(err);
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

function LeftPadWithZeros(number, length){
    var str = '' + number;
    while (str.length < length) {
        str = '0' + str;
    }

    return str;
}

function generateId(table, callback) {
    connection.query('SELECT max(id) as counter from ' + table, function(err, res) {
        if(err) throw err;
        var counter = res[0].counter;
        if(!counter){
            counter = 1;
        }
        counter++; 
        var prefix;
        switch(table){
            case 'user_driver':
                prefix = 'DR';
                break;
            case 'user_rider':
                prefix = 'RD';
                break;
            case 'vehicle_owner':
                prefix = 'OV';
                break;
            case 'vehicle_master':
                prefix = 'TR';
                break;
            case 'user_admin':
                prefix = 'AI';
                break;
        }
        var random = Math.random().toString().slice(2,11);
        var uid = prefix + random + LeftPadWithZeros(base62.encode(counter), 5);
        callback(uid);
    });
       // this will "return" your value to the original caller
   
  }

// var generateId = function generateId(table) {
//     connection.query('SELECT max(id) as counter from ' + table, function(err, res) {
//         if(err) throw err;
//         var counter = res[0].counter;
//         if(!counter){
//             counter = 1;
//         }
//         counter++; 
//         var prefix;
//         switch(table){
//             case 'user_driver':
//                 prefix = 'DR';
//                 break;
//             case 'user_rider':
//                 prefix = 'RD';
//                 break;
//             case 'vehicle_owner':
//                 prefix = 'OV';
//                 break;
//             case 'vehicle_master':
//                 prefix = 'TR';
//                 break;
//             case 'user_admin':
//                 prefix = 'AI';
//                 break;
//         }
//         var random = Math.random().toString().slice(2,11);
//         var uid = prefix + random + LeftPadWithZeros(base62.encode(counter), 5);
//         console.log(uid);
//         return uid;
//     });
// }
var t0 = now();


        for(var i = 0; i < 10; i++){
            var user = {
                email: faker.internet.email().toLowerCase(),
                phone: faker.phone.phoneNumberFormat().replace(/-/g, ''), 
                first_name: faker.name.firstName(),
                last_name: faker.name.lastName(),
                avatar_type: 'gravatar',
                avatar_uri: 'doodle.png',
                password: faker.internet.password(),
                last_login: moment().format("YYYY-MM-DD HH:mm:ss"),
                token: cuid().substr(0,16),
                created_by: 1
            };
            console.log(user);
            // connection.query('INSERT INTO user_master SET ?', user, (err, res) => {
            //     if(err) throw err;  
            //     console.log('Last insert ID User_master:', res.insertId);
            // });
            if(i % 3 === 0){
                var driver_id;
                generateId('user_driver', function(response) {
                    // use the return value here instead of like a regular (non-evented) return value
                    driver_id = response;
                    console.log("Driver Id output: " + driver_id);
                });
                console.log("outpi: " + driver_id);
                //var driver_id = await( generateId('user_driver') );
                //var driver_id = generateId('user_driver');
                
                var driver = {
                    driver_id: driver_id,
                    email: user.email,
                    rating: null,
                    confirmation_code: null,
                    confirmed: 0
                };
                console.log(driver);
                // connection.query('INSERT INTO user_driver SET ?', driver, (err, res) => {
                //     if(err) throw err;
                //     console.log('Last insert ID Driver:', res.insertId);
                // });
            }else{
                var rider_id
                generateId('user_rider', function(response) {
                    // use the return value here instead of like a regular (non-evented) return value
                   rider_id = response;
                    console.log("Rider Id output: " + rider_id);
                });
                //var rider_id = await( generateId('user_rider' ) );
                var rider = {
                    rider_id : rider_id,
                    email: user.email,
                    rating: null,
                    confirmation_code: null,
                    confirmed: null
                };
                console.log(rider);
                // connection.query('INSERT INTO user_rider SET ?', rider, (err, res) => {
                //     if(err) throw err;  
                //     console.log('Last insert ID Rider:', res.insertId);
                // });
            }
        }






var t1 = now()
console.log("Call to doSomething took " + (t1 - t0).toFixed(3) + " milliseconds.");

function createVehicles(){

}
// connection.query('SELECT * FROM passenger', function(err, res){
//     if(err) throw err;
//     for(var i = 0; i < res.length; i++){
//         var id = res[i]['p_id'];
//         var packet = {
//             p_uuid : res[i]['p_uuid'],
//             name: res[i]['p_uuid'],
//             phone_num: res[i]['phone_num'], 
//             card_num: res[i]['card_num'],
//             card_exp_date: res[i]['card_exp_date']  
//         };
//         client.set(id, packet.toString());
//     }
// });






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