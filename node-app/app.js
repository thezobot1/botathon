var express = require('express');
var bodyparser = require('body-parser');
var mysql = require("mysql");
var toArray = require( 'object-values-to-array' );
var table = require('text-table');
const util = require('util');
const fs = require('fs');
const Transaction = require('./transaction');
const Query = require('./query');


mysql.pool = mysql.createPool({ 
	connectionLimit: 100,
	host: "localhost",
	user: "root",
	password: "root",
	database: "chatapp",
	socketPath: '/Applications/MAMP/tmp/mysql/mysql.sock'	
});

var app = express();

// Enable CORS
app.use(function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  next();
});

// To read JSON posted data
app.use(bodyparser.json());

// Bus API

app.use("/bus/schedule", busSchedule);
app.use("/bus/duration", busDuration);
app.use("/bus/next", busNext);
app.use("/bus/last", busLast);

function tableGen(prows){
	var outputArr = [];
	for(var i = 0; i < prows.length; i++){
		var row = prows[i];
		var arr = [];
		for (key in row) {
			arr.push(row[key]);
		}
		outputArr.push(arr);
	}
	var result = {}
	result['result'] = table(outputArr);
	return result;
}

function busSchedule(req, res, next) {

	var sql = "SELECT * FROM bus_timings WHERE type = 'N'";
	
	var d = new Date();
    var n = d.getDay();
    if ( n == 0 || n == 6 ) {
    	sql = "SELECT * FROM bus_timings WHERE type = 'H'";
    } else if ( n == 5 ) {
    	sql = "SELECT * FROM bus_timings WHERE type = 'N' OR type = 'F'";
    }

	const query = new Query(mysql);
	query.exec(sql)
	.then(function(prows){
		res.json(tableGen(prows));
	})
	.catch(function(err) {
		console.log('Query Error:' + err);
		res.send("Database error:<br>" + err);
	});
}

function busDuration(req, res, next) {
	var result = {};
	result['result'] = 'The bus ride can take anywhere from 45 mins to 1 hour 30 mins depending on traffic';
	res.json(result);
}

function busNext(req, res, next) {

	var source = req.query.source;
	if (source != "City") {
		source = "Guwahati";
	}

	var time = new Date();
	var hhmmss = ("0" + time.getHours()).slice(-2)   + ":" + ("0" + time.getMinutes()).slice(-2) + ":" + ("0" + time.getSeconds()).slice(-2);
	var sql = "SELECT * from bus_timings where timing > CAST('" + hhmmss + "' AS time) AND coming_from = '" + source + "' ORDER BY timing";
	const query = new Query(mysql);
	query.exec(sql)
	.then(function(prows){
		res.json(tableGen(prows));
	})
	.catch(function(err) {
		console.log('Query Error:' + err);
		res.send("Database error:<br>" + err);
	});
}

function busLast(req, res, next) {

	var source = req.query.source;
	if (source != "City") {
		source = "Guwahati";
	}

	var sql = "SELECT * from bus_timings WHERE coming_from = '" + source + "' ORDER BY timing DESC";
	console.log(sql);
	const query = new Query(mysql);
	query.exec(sql)
	.then(function(prows){
		res.json(prows[0]);
	})
	.catch(function(err) {
		console.log('Query Error:' + err);
		res.send("Database error:<br>" + err);
	});
}

// Courses API

app.use("/courses/rollno", coursesForRollNo);
app.use("/courses/description", courseDescription);
app.use("/courses/books", courseBooks);
app.use("/courses/title", courseTitle);
app.use("/courses/credits", courseCredits);
app.use("/courses/random", courseRandom);

function coursesForRollNo(req, res, next) {
	var rollno = req.query.rollno;
	var year = rollno.substring(0,2);
	var deptno = rollno.substring(4,6);
	
	var semno = '2';

	switch(year){
		case '15':
			semno = '4';
			break;
		case '16':
			semno = '2';
			break;
		case '14':
			semno = '6';
			break;
		case '13':
			semno = '8';
			break;
		default:
			semno = '2';
			break;

	}

	var deptname = 'EE';
	switch(deptno){
		case '01':
			deptname = 'CS';
			break;
		case '02':
			deptname = 'EE';
			break;
		case '21':
			deptname = 'PH';
			break;
		default:
			deptname = 'EE';
			break;
	}

	if (semno == "2") {
		deptname = "FY";
	}

	var sql = "SELECT * FROM courses WHERE dept = '"+deptname+"' AND sem = '"+semno+"'";

	const query = new Query(mysql);
	query.exec(sql)
	.then(function(prows){
		res.json(tableGen(prows));
	})
	.catch(function(err) {
		console.log('Query Error:' + err);
		res.send("Database error:<br>" + err);
	});
}

function courseDescription(req, res, next) {
	var code = req.query.code;
	var sql = "SELECT * FROM courses WHERE title = '"+code+"'";

	const query = new Query(mysql);
	query.exec(sql)
	.then(function(prows){
		res.json(tableGen(prows));
	})
	.catch(function(err) {
		console.log('Query Error:' + err);
		res.send("Database error:<br>" + err);
	});
}

function courseBooks(req, res, next) {
	var code = req.query.code;
	var sql = "SELECT textbooks FROM courses WHERE title = '"+code+"'";

	const query = new Query(mysql);
	query.exec(sql)
	.then(function(prows){
		res.json(tableGen(prows));
	})
	.catch(function(err) {
		console.log('Query Error:' + err);
		res.send("Database error:<br>" + err);
	});
}

function courseTitle(req, res, next) {
	var code = req.query.code;
	var sql = "SELECT name FROM courses WHERE title = '"+code+"'";

	const query = new Query(mysql);
	query.exec(sql)
	.then(function(prows){
		res.json(tableGen(result));
	})
	.catch(function(err) {
		console.log('Query Error:' + err);
		res.send("Database error:<br>" + err);
	});
}

function courseCredits(req, res, next) {
	var code = req.query.code;
	var sql = "SELECT ltpc FROM courses WHERE title = '"+code+"'";

	const query = new Query(mysql);
	query.exec(sql)
	.then(function(prows){
		res.json(tableGen(prows));
	})
	.catch(function(err) {
		console.log('Query Error:' + err);
		res.send("Database error:<br>" + err);
	});
}

function getRandomInt(min, max) {
	min = Math.ceil(min);
	max = Math.floor(max);
	return Math.floor(Math.random() * (max - min)) + min;
}

function courseRandom(req, res, next) {
	var sql = "SELECT * FROM courses";

	const query = new Query(mysql);
	query.exec(sql)
	.then(function(prows){
		res.json(prows[getRandomInt(0, prows.length - 1)]);
	})
	.catch(function(err) {
		console.log('Query Error:' + err);
		res.send("Database error:<br>" + err);
	});
}

// Exams API

app.use("/exam/course", examCourseDate);
app.use("/exam/end", examEndDate);
app.use("/exam/list", examList);
app.use("/exam/last", examLast);
app.use("/exam/first", examFirst);

function examCourseDate(req, res, next) {
	var code = req.query.code;
	var sql = "SELECT date FROM timetable WHERE code = '"+code+"'";

	const query = new Query(mysql);
	query.exec(sql)
	.then(function(prows){
		res.json(tableGen(prows));
	})
	.catch(function(err) {
		console.log('Query Error:' + err);
		res.send("Database error:<br>" + err);
	});
}

function examEndDate(req, res, next) {
	
	var rollno = req.query.rollno;
	var year = rollno.substring(0,2);
	var deptno = rollno.substring(4,6);
	
	var semno = '2';

	switch(year){
		case '15':
			semno = '4';
			break;
		case '16':
			semno = '2';
			break;
		case '14':
			semno = '6';
			break;
		case '13':
			semno = '8';
			break;
		default:
			semno = '2';
			break;

	}

	var deptname = 'EE';
	switch(deptno){
		case '01':
			deptname = 'CS';
			break;
		case '02':
			deptname = 'EE';
			break;
		case '21':
			deptname = 'PH';
			break;
		default:
			deptname = 'EE';
			break;
	}


	var sql = "SELECT date FROM timetable WHERE dept = '"+deptname+"' AND sem = '"+semno+"' ORDER BY date DESC";

	const query = new Query(mysql);
	query.exec(sql)
	.then(function(prows){
		res.json(tableGen(prows[0]));
	})
	.catch(function(err) {
		console.log('Query Error:' + err);
		res.send("Database error:<br>" + err);
	});
}

function examList(req, res, next) {
	
	var rollno = req.query.rollno;
	console.log(rollno);
	var year = rollno.substring(0,2);
	var deptno = rollno.substring(4,6);
	
	var semno = '2';

	switch(year){
		case '15':
			semno = '4';
			break;
		case '16':
			semno = '2';
			break;
		case '14':
			semno = '6';
			break;
		case '13':
			semno = '8';
			break;
		default:
			semno = '2';
			break;

	}

	var deptname = 'EE';
	switch(deptno){
		case '01':
			deptname = 'CS';
			break;
		case '02':
			deptname = 'EE';
			break;
		case '21':
			deptname = 'PH';
			break;
		default:
			deptname = 'EE';
			break;
	}


	var sql = "SELECT * FROM timetable WHERE dept = '"+deptname+"' AND sem = '"+semno+"'";

	const query = new Query(mysql);
	query.exec(sql)
	.then(function(prows){
		console.log(tableGen(prows));
		res.json(tableGen(prows));
	})
	.catch(function(err) {
		console.log('Query Error:' + err);
		res.send("Database error:<br>" + err);
	});
}

function examFirst(req, res, next) {
	
	var rollno = req.query.rollno;
	var year = rollno.substring(0,2);
	var deptno = rollno.substring(4,6);
	
	var semno = '2';

	switch(year){
		case '15':
			semno = '4';
			break;
		case '16':
			semno = '2';
			break;
		case '14':
			semno = '6';
			break;
		case '13':
			semno = '8';
			break;
		default:
			semno = '2';
			break;

	}

	var deptname = 'EE';
	switch(deptno){
		case '01':
			deptname = 'CS';
			break;
		case '02':
			deptname = 'EE';
			break;
		case '21':
			deptname = 'PH';
			break;
		default:
			deptname = 'EE';
			break;
	}


	var sql = "SELECT * FROM timetable WHERE dept = '"+deptname+"' AND sem = '"+semno+"'";

	const query = new Query(mysql);
	query.exec(sql)
	.then(function(prows){
		res.json(prows[0]);
	})
	.catch(function(err) {
		console.log('Query Error:' + err);
		res.send("Database error:<br>" + err);
	});
}

function examLast(req, res, next) {
	
	var rollno = req.query.rollno;
	var year = rollno.substring(0,2);
	var deptno = rollno.substring(4,6);
	
	var semno = '2';

	switch(year){
		case '15':
			semno = '4';
			break;
		case '16':
			semno = '2';
			break;
		case '14':
			semno = '6';
			break;
		case '13':
			semno = '8';
			break;
		default:
			semno = '2';
			break;

	}

	var deptname = 'EE';
	switch(deptno){
		case '01':
			deptname = 'CS';
			break;
		case '02':
			deptname = 'EE';
			break;
		case '21':
			deptname = 'PH';
			break;
		default:
			deptname = 'EE';
			break;
	}


	var sql = "SELECT * FROM timetable WHERE dept = '"+deptname+"' AND sem = '"+semno+"'";

	const query = new Query(mysql);
	query.exec(sql)
	.then(function(prows){
		res.json(prows[prows.length - 1]);
	})
	.catch(function(err) {
		console.log('Query Error:' + err);
		res.send("Database error:<br>" + err);
	});
}

// Restaurant API's

app.use("/food/suggest",foodSuggest);
app.use("/food/list",foodList);
app.use("/food/search",foodSearch);

function foodSuggest(req, res, next) {
	var sql = "SELECT * FROM restros";
	const query = new Query(mysql);
	query.exec(sql)
	.then(function(prows){
		res.json(prows[getRandomInt(0, prows.length - 1)]);
	})
	.catch(function(err) {
		console.log('Query Error:' + err);
		res.send("Database error:<br>" + err);
	});
}

function foodList(req, res, next) {
	var sql = "SELECT * FROM restros";
	const query = new Query(mysql);
	query.exec(sql)
	.then(function(prows){
		res.json(tableGen(prows));
	})
	.catch(function(err) {
		console.log('Query Error:' + err);
		res.send("Database error:<br>" + err);
	});
}


function foodSearch(req, res, next) {
	var keyword = req.query.keyword;
	keyword = keyword.toUpperCase();
	var sql = "SELECT * FROM restros WHERE keywords LIKE '%"+keyword+"%'";
	const query = new Query(mysql);
	query.exec(sql)
	.then(function(prows){
		res.json(tableGen(prows));
	})
	.catch(function(err) {
		console.log('Query Error:' + err);
		res.send("Database error:<br>" + err);
	});
}

var server = app.listen(3333, function () {
	console.log('mysql app listening on port 3333!');
});