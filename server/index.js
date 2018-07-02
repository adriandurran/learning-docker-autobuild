const express = require('express');

const app = express();

app.use((req, res, next) => {
  const error = new Error('Not found');
  error.status = 404;
  next(error);
});

app.use((error, req, res, next) => {
  res.status(error.status || 500);
  res.json({
    error: {
      message: error.message
    }
  });
});

if (process.env.NODE_ENV === 'production') {
  app.use(express.static('client'));
  const path = require('path');
  app.get('*', (req, res) => {
    res.sendFile(path.resolve(__dirname, 'client', 'index.html'));
  });
}

const PORT = process.env.PORT || 5090;
const server = app.listen(PORT);

module.exports = app;
