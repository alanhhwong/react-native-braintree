'use strict';

var RNBraintree = require('NativeModules').RNBraintree;

var Braintree = {
	setup(token, bundleId) {
		RNBraintree.setup(token, bundleId);
	},

	showPaymentViewController(callback) {
		RNBraintree.showPaymentViewController(callback);
	},

	showPayPalViewController(callback) {
		RNBraintree.showPayPalViewController(callback);
	}
};

module.exports = Braintree;