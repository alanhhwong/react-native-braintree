#import "RCTBridgeModule.h"
#import <Braintree/Braintree.h>

@interface RNBraintree : UIViewController <RCTBridgeModule, BTDropInViewControllerDelegate, BTPaymentMethodCreationDelegate>

@property (nonatomic, strong) Braintree *braintree;
@property (nonatomic, strong) UIViewController *reactRoot;

@property (nonatomic, strong) RCTResponseSenderBlock callback;

+ (instancetype)sharedInstance;
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;

@end
