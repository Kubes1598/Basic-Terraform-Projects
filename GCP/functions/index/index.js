const functions = require('@google-cloud/functions-framework');

functions.http('helloHttpcc', (req, res) => {
  res.send(`Hello ${req.query.name || req.body.name || 'World! From Cloud Console'}`);
});
