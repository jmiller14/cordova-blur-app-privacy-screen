#import "AppDelegate.h"
#import "AppDelegate+BlurPrivacyScreen.h"
#import "BlurPrivacyScreen.h"

@implementation AppDelegate (BlurPrivacyScreen)

- (void)applicationWillResignActive:(UIApplication *)application {
    [self showBlur];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [self hideBlur];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    [self hideBlur];
}

- (void)showBlur {
    BlurPrivacyScreen *plugin = [self.viewController getCommandInstance:@"BlurPrivacyScreen"];

    if (plugin == nil || ![plugin isSecured]) {
        return;
    }

    NSLog(@"Showing blur");
    self.window.backgroundColor = [UIColor clearColor];

    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    blurEffectView.frame = self.window.bounds;
    blurEffectView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

    blurEffectView.tag = 1234;
    blurEffectView.alpha = 0;
    [self.window addSubview:blurEffectView];
    [self.window bringSubviewToFront:blurEffectView];

    // fade in the view
    [UIView animateWithDuration:0.3 animations:^{
        blurEffectView.alpha = 1;
    }];
}

- (void)hideBlur {
    NSLog(@"Hiding blur");
    // grab a reference to our custom blur view
    UIView *blurEffectView = [self.window viewWithTag:1234];

    if (blurEffectView == nil) {
        return;
    }

    // fade away colour view from main view
    [UIView animateWithDuration:0.3 animations:^{
        blurEffectView.alpha = 0;
    } completion:^(BOOL finished) {
        // remove when finished fading
        [blurEffectView removeFromSuperview];
    }];
}

@end
