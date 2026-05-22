const express = require('express');
const app = express();
const serveIndex = require('serve-index');
const path = require('path');

const PORT = 3000;

app.use('/files', express.static(path.join(__dirname, 'public')));
app.use('/files', serveIndex(path.join(__dirname, 'public'), { 'icons': true }));

app.get('/', (req, res) => {
    res.send('<h1>Welcome! This system is secure.</h1>');
});

app.listen(PORT, () => console.log(`App is running in ${PORT}`));