#import "RCTBridge.h"
#import <Braintree/Braintree.h>

@interface RNBraintree : UIViewController <RCTBridgeModule, BTDropInViewControllerDelegate>

@property (nonatomic, strong) Braintree *braintree;
@property (nonatomic, strong) UIViewController *reactRoot;

@property (nonatomic, strong) RCTResponseSenderBlock callback;

@end
