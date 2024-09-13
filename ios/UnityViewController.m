//
//  UnityViewController.m
//  UnityController
//
//  Created by Michael A Edgcumbe on 9/12/24.
//

#import <UIKit/UIKit.h>
#import "UnityFramework/UnityFramework.h"

@interface UnityViewController : UIViewController

@property (nonatomic, strong) UIView *unityView;
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
        self.unityView = [ufw.appController rootView];
        if (self.unityView) {
            self.unityView.frame = self.view.bounds;
            [self.view addSubview:self.unityView];
        }
      free(newArgv);
    }
}
@end
