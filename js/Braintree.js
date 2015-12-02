'use strict';

var RNBraintree = require('react-native').NativeModules.RNBraintree;

var Braintree = {

	setupWithURLScheme(token, urlscheme) {
		RNBraintree.setupWithURLScheme(token, urlscheme);
	},

	setup(token) {
		RNBraintree.setup(token);
	},

	showPaymentViewController(callback) {
		RNBraintree.showPaymentViewController(callback);
	},

	showPayPalViewController(callback) {
		RNBraintree.showPayPalViewController(callback);
	}

};

module.exports = Braintree;
