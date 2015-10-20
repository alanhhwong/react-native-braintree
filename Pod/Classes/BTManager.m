//
//  BTManager.m
//  BTReactNative
//
//  Created by Alan Wong on 25/9/15.
//  Copyright © 2015 Facebook. All rights reserved.
//

#import "BTManager.h"
#import "RCTUtils.h"

@implementation BTManager

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(setup:(NSString *)clientToken)
{
  
  self.braintree = [Braintree braintreeWithClientToken:clientToken];
  NSLog(@"Braintree Client initialized.");
  
}

RCT_EXPORT_METHOD(showPaymentViewController:(RCTResponseSenderBlock)callback)
{
  
  BTDropInViewController *dropInViewController = [self.braintree dropInViewControllerWithDelegate:self];
  dropInViewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(userDidCancelPayment)];
  
  self.callback = callback;

  UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:dropInViewController];
  
  self.reactRoot = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
  [self.reactRoot presentViewController:navigationController animated:YES completion:nil];
}

- (void)userDidCancelPayment {
  
  NSLog(@"User Cancelled");
  [self.reactRoot dismissViewControllerAnimated:YES completion:nil];
}

- (void)dropInViewController:(__unused BTDropInViewController *)viewController didSucceedWithPaymentMethod:(BTPaymentMethod *)paymentMethod {
  
  NSLog(@"Payment Success");
  self.callback(@[[NSNull null],paymentMethod.nonce]);
  [viewController dismissViewControllerAnimated:YES completion:nil];
  
}

- (void)dropInViewControllerDidCancel:(__unused BTDropInViewController *)viewController {
  
  NSLog(@"DropInViewController Cancelled");
  [viewController dismissViewControllerAnimated:YES completion:nil];
  
}

@end
