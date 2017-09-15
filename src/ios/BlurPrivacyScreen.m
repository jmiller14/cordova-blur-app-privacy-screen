#import "BlurPrivacyScreen.h"

@interface BlurPrivacyScreen() {

}

@end

@implementation BlurPrivacyScreen

- (id)init {
    self = [super init];

    if (self) {
        self.isSecured = NO;
    }

    return self;
}

- (void)setSecuredStatus:(CDVInvokedUrlCommand*)command {
    self.isSecured = [[command.arguments objectAtIndex:0] boolValue];
}

@end
