#import "RCTBridgeModule.h"
#import <Braintree/Braintree.h>

@interface RNBraintree : UIViewController <RCTBridgeModule, BTDropInViewControllerDelegate, BTPaymentMethodCreationDelegate>

@property (nonatomic, strong) Braintree *braintree;
@property (nonatomic, strong) UIViewController *reactRoot;

@property (nonatomic, strong) RCTResponseSenderBlock callback;

@end
