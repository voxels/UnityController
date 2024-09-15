//
//  UnityViewController.m
//  UnityController
//
//  Created by Michael A Edgcumbe on 9/12/24.
//

#import <UIKit/UIKit.h>
#import "UnityFramework/UnityFramework.h"

@interface UnityViewController : UIViewController

@property (nonatomic, strong) UIView *gameView;
@property (nonatomic, strong) UnityFramework *ufw;

@end

@implementation UnityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Initialize Unity
    UnityFramework *ufw = [UnityFramework getInstance];
    if (ufw) {
        self.ufw = ufw;
        const char *customArg1 = "UnityController";
      // Create a new argv array with extra space for custom arguments
        char **newArgv = (char **)malloc(sizeof(char*));
      newArgv[0] = (char*)customArg1;
      [ufw runEmbeddedWithArgc:1 argv:newArgv appLaunchOpts: nil];
        self.gameView = [ufw.appController rootView];
        if (self.gameView) {
            self.gameView.frame = self.view.bounds;
            [self.gameView setExclusiveTouch:true];
            [self.view addSubview:self.gameView];
        }
      free(newArgv);
    }
}

- (void)handleTapEvent {
    // Ensure this runs on the main thread
    dispatch_async(dispatch_get_main_queue(), ^{
      NSLog(@"tap");
        // Send a message to a GameObject in Unity
//        [self.ufw sendMessageToGOWithName:"YourGameObjectName" functionName:"YourFunctionName" message:"YourMessage"];
    });
}

@end
