'use strict';

var RNBraintree = require('react-native').NativeModules.RNBraintree;

var Braintree = {
	setup(token) {
		RNBraintree.setup(token);
	},

	showPaymentViewController(callback) {
		RNBraintree.showPaymentViewController(callback);
	}
};

module.exports = Braintree;