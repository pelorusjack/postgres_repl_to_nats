var jsonfile = require('jsonfile')
var inFileName = './lapidus.json.template'
var outFileName = './lapidus.json'
var config = jsonfile.readFileSync(inFileName);

config.backends.password =  process.env.REPLPW;
config.plugins.nats.server = process.env.NATS_URI;

jsonfile.writeFileSync(outFileName, config, {spaces: 2});
