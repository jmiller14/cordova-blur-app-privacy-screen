var exec = require('cordova/exec');

exports.enable = function() {
  exec(null, null, 'BlurPrivacyScreen', 'setSecuredStatus', [ true ]);
};

exports.disable = function() {
  exec(null, null, 'BlurPrivacyScreen', 'setSecuredStatus', [ false ]);
};
