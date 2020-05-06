'use strict';

var RNBraintree = require('react-native').NativeModules.RNBraintree;

var Braintree = {

	setupWithURLScheme(token, urlscheme) {
		return new Promise(function(resolve, reject) {
			RNBraintree.setupWithURLScheme(token, urlscheme, function(success) {
				success == true ? resolve(true) : reject("Invalid Token");
			});
		});
	},

	setup(token) {
		return new Promise(function(resolve, reject) {
			RNBraintree.setup(token, function(success) {
				success == true ? resolve(true) : reject("Invalid Token");
			});
		});
	},

	showPaymentViewController() {
		return new Promise(function(resolve, reject) {
			RNBraintree.showPaymentViewController(function(err, nonce) {
				nonce != null ? resolve(nonce) : reject(err);
			});
		});
	},

	showPayPalViewController() {
		return new Promise(function(resolve, reject) {
			RNBraintree.showPayPalViewController(function(err, nonce) {
				nonce != null ? resolve(nonce) : reject(err);
			});
		});
	},

	showPayPalPlusEmailViewController() {
		return new Promise(function(resolve, reject) {
			RNBraintree.showPayPalPlusEmailViewController(function(err, data) {
				data != null ? resolve(data) : reject(err);
			});
		});
	},

	showPayPalPlusAttributesViewController() {
		return new Promise(function(resolve, reject) {
			RNBraintree.showPayPalPlusAttributesViewController(function(err, data) {
				data != null ? resolve(data) : reject(err);
			});
		});
	},

        showBillingAgreementViewController() {
	        return new Promise(function(resolve, reject) {
                    RNBraintree.showBillingAgreementViewController(function(err, nonce) {
			nonce != null ? resolve(nonce) : reject(err);
                    });
		});
	},

	getPayPalClientMetadataId() {
	        return new Promise(function(resolve, reject) {
		    RNBraintree.getPayPalClientMetadataId(function(err, nonce) {
			nonce != null ? resolve(nonce) : reject(err);
		    });
		});
	},

        getCardNonce(cardNumber, expirationMonth, expirationYear) {
    	        return new Promise(function(resolve, reject) {
    		    RNBraintree.getCardNonce(cardNumber, expirationMonth, expirationYear, function(err, nonce) {
    			nonce != null ? resolve(nonce) : reject(err);
    		    });
    		});
	}

};

module.exports = Braintree;
