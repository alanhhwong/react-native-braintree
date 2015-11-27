'use strict';

var RNBraintree = require('NativeModules').RNBraintree;

var Braintree = {

	setupWithBundleId(token, bundleId) {
		RNBraintree.setupWithBundleId(token, bundleId);
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