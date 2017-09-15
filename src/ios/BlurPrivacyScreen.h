#import <Cordova/CDV.h>

@interface BlurPrivacyScreen : CDVPlugin

- (void)setSecuredStatus:(CDVInvokedUrlCommand*)command;

@property (nonatomic, assign) BOOL isSecured;

@end
