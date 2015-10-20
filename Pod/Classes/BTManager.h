//
//  BTManager.h
//  BTReactNative
//
//  Created by Alan Wong on 25/9/15.
//  Copyright © 2015 Facebook. All rights reserved.
//

#import "RCTBridge.h"
#import <Braintree/Braintree.h>

@interface BTManager : UIViewController <RCTBridgeModule, BTDropInViewControllerDelegate>

@property (nonatomic, strong) Braintree *braintree;
@property (nonatomic, strong) UIViewController *reactRoot;

@property (nonatomic, strong) RCTResponseSenderBlock callback;

@end
