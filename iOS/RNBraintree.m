#import "RNBraintree.h"
#import "RCTUtils.h"

@implementation RNBraintree

static NSString *URLScheme;

+ (instancetype)sharedInstance {
    static RNBraintree *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[RNBraintree alloc] init];
    });
    return _sharedInstance;
}

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(setupWithURLScheme:(NSString *)clientToken urlscheme:(NSString*)urlscheme)
{
  URLScheme = urlscheme;
  [Braintree setReturnURLScheme:urlscheme];
  self.braintree = [Braintree braintreeWithClientToken:clientToken];
}

RCT_EXPORT_METHOD(setup:(NSString *)clientToken)
{
  self.braintree = [Braintree braintreeWithClientToken:clientToken];
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

RCT_EXPORT_METHOD(showPayPalViewController:(RCTResponseSenderBlock)callback)
{

  self.callback = callback;

  BTPaymentProvider *provider = [self.braintree paymentProviderWithDelegate:self];

  [provider createPaymentMethod:BTPaymentProviderTypePayPal];

}

RCT_EXPORT_METHOD(getCardNonce: (NSString *)cardNumber
               expirationMonth: (NSString *)expirationMonth
                expirationYear: (NSString *)expirationYear
                      callback: (RCTResponseSenderBlock)callback
    )
{
  BTClientCardRequest *request = [BTClientCardRequest new];
  request.number = cardNumber;
  request.expirationMonth = expirationMonth;
  request.expirationYear = expirationYear;

  [self.braintree tokenizeCard:request
    completion:^(NSString *nonce, NSError *error) {
      NSArray *args = @[];
      if ( error == nil ) {
      args = @[[NSNull null], nonce];
      } else {
      args = @[error.description, [NSNull null]];
      }
      callback(args);
    }];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {

    if ([url.scheme localizedCaseInsensitiveCompare:URLScheme] == NSOrderedSame) {
        return [Braintree handleOpenURL:url sourceApplication:sourceApplication];
    }
    return NO;
}

- (void)paymentMethodCreator:(id)sender didCreatePaymentMethod:(BTPaymentMethod *)paymentMethod {
  self.callback(@[[NSNull null],paymentMethod.nonce]);
}

- (void)paymentMethodCreatorWillPerformAppSwitch:(id)sender {
  // TODO
}

- (void)paymentMethodCreatorWillProcess:(id)sender {
  // TODO
}

- (void)paymentMethodCreatorDidCancel:(id)sender {
  self.callback(@[[NSString stringWithFormat:@"User cancelled payment request"],[NSNull null]]);
}

- (void)paymentMethodCreator:(id)sender didFailWithError:(NSError *)error {
  self.callback(@[[NSString stringWithFormat:@"%@",error.description],[NSNull null]]);
}

- (void)paymentMethodCreator:(id)sender requestsPresentationOfViewController:(UIViewController *)viewController {
  self.reactRoot = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
  [self.reactRoot presentViewController:viewController animated:YES completion:nil];
}

- (void)paymentMethodCreator:(id)sender requestsDismissalOfViewController:(UIViewController *)viewController {
  self.reactRoot = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
  [self.reactRoot dismissViewControllerAnimated:true completion:nil];
}

- (void)userDidCancelPayment {
  [self.reactRoot dismissViewControllerAnimated:YES completion:nil];
}

- (void)dropInViewController:(__unused BTDropInViewController *)viewController didSucceedWithPaymentMethod:(BTPaymentMethod *)paymentMethod {
  self.callback(@[[NSNull null],paymentMethod.nonce]);
  [viewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)dropInViewControllerDidCancel:(__unused BTDropInViewController *)viewController {
  [viewController dismissViewControllerAnimated:YES completion:nil];
}

@end
