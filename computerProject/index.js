'use strict';
const path = require('path');
const express = require('express');
const app = express();

const { port, host } = require('./config.json');

const Datastorage = require('./sqlStorage/dataStorageLayer');

const storage = new Datastorage();

app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'public', 'pages'));
// app.use(express.json()); to put json in the root for all that use json

app.use(express.static(path.join(__dirname, 'public')));
app.use(express.urlencoded({ extended: false }));

app.get('/', (req, res) => res.sendFile(path.join(__dirname, 'menu.html')));

app.get('/computers', (req, res) => storage.getAll()
    .then(data => res.json(data))
    .catch(err => res.json(err)))

app.get('/computers/:id', express.json(), (req, res) =>
    storage.getOne(req.params.id)
        .then(data => res.json(data))
        .catch(err => res.json(err)))

app.post('/getone', (req, res) =>
    storage.getOne(req.body.id)
        .then(data => res.render('oneComputer', { computer: data }))
        .catch(err => res.json(err)))

app.listen(port, host, () => console.log(`${host}:${port} serving...`));