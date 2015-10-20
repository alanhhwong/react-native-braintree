'use strict';

var RNBraintree = require('NativeModules').RNBraintree;

var Braintree = {
	setup(token) {
		RNBraintree.setup(token);
	},

	showPaymentViewController(callback) {
		RNBraintree.showPaymentViewController(callback);
	}
};

module.exports = Braintree;