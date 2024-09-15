//
//  UnityViewController.m
//  UnityController
//
//  Created by Michael A Edgcumbe on 9/12/24.
//

#import <UIKit/UIKit.h>
#import "UnityFramework/UnityFramework.h"

@interface UnityViewController : UIViewController

@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) UIView *gameView;
@property (nonatomic, strong) UnityFramework *ufw;
@property (nonatomic, strong) UIViewController *hostViewController;

@end

@implementation UnityViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self buildUnity];
  [self buildBackButton];
}


- (void) buildUnity {
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
      [self.view addSubview:self.gameView];
    }
    free(newArgv);
  }
}

- (void) buildBackButton {
  self.backButton = [[UIButton alloc] initWithFrame:CGRectMake(24, 48, 44, 44)];
  
  // Customize the button appearance (e.g., background color, title, etc.)
  [self.backButton setTitle:@"X" forState:UIControlStateNormal];
  [self.backButton setBackgroundColor:[UIColor colorWithWhite:0.0 alpha:0.9]];  // Button background color
  [self.backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
  
  // Round the corners of the button
  self.backButton.layer.cornerRadius = self.backButton.frame.size.width / 2; // Fully rounded (circle)
  self.backButton.layer.masksToBounds = YES;  // Ensure the corners are clipped to the bounds
  
  // Add border (optional)
  self.backButton.layer.borderColor = [UIColor whiteColor].CGColor;
  self.backButton.layer.borderWidth = 2.0;  // Optio
  // Add the target-action for the button press event
  [self.backButton addTarget:self action:@selector(exitUnity) forControlEvents:UIControlEventTouchUpInside];
  
  // Add the button to the view
  [self.view addSubview:self.backButton];
}

- (void) exitUnity {
  if (self.hostViewController == nil ) {
    NSLog(@"Missing host view controller");
    return;
  }
  
  [UIView transitionWithView:[[UIApplication sharedApplication] delegate].window
                    duration:0.5
                     options:UIViewAnimationOptionTransitionFlipFromRight
                  animations:^{
    [[UIApplication sharedApplication] delegate].window.rootViewController = self.hostViewController;
  }
                  completion:nil];
  
  // Ensure the window is visible
  [[[UIApplication sharedApplication] delegate].window makeKeyAndVisible];
}

@end
