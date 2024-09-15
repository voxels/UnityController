#import "UnityViewManager.h"
#import "UnityViewController.h"
#import <React/RCTBridgeModule.h>

@interface UnityViewManager() <RCTBridgeModule>
@property (nonatomic, strong) UnityViewController *unityVC;
@end

@implementation UnityViewManager

RCT_EXPORT_MODULE(UnityViewManager)

+ (BOOL)requiresMainQueueSetup
{
    return YES;
}


- (UIView *)view
{
    self.unityVC = [[UnityViewController alloc] init];
    if (!self.unityVC.view) {
        NSLog(@"Error: unityVC.view is nil");
        return [UIView new]; // Return an empty view to prevent crashes
    }
    return self.unityVC.view;
}

RCT_EXPORT_METHOD(sendTapEventToUnity)
{
  dispatch_async(dispatch_get_main_queue(), ^{
    self.unityVC = [[UnityViewController alloc] init];

    [UIView transitionWithView:[[UIApplication sharedApplication] delegate].window
                          duration:0.5
                           options:UIViewAnimationOptionTransitionFlipFromRight
                        animations:^{
                        [[UIApplication sharedApplication] delegate].window.rootViewController = self.unityVC;
                        }
                        completion:nil];

        // Ensure the window is visible
      [[[UIApplication sharedApplication] delegate].window makeKeyAndVisible];
  });
}

@end
