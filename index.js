var jsonfile = require('jsonfile')
var inFileName = './lapidus.json.template'
var outFileName = './lapidus.json'
var config = jsonfile.readFileSync(inFileName);

config.backends[0].host =  process.env.REPLHOST || "127.0.0.1";
config.backends[0].password =  process.env.REPLPW || "password";
config.plugins.nats.server = process.env.NATS_URI;

jsonfile.writeFileSync(outFileName, config, {spaces: 2});
