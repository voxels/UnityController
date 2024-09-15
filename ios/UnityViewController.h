//
//  UnityViewController.h
//  UnityController
//
//  Created by Michael A Edgcumbe on 9/12/24.
//

#import <UIKit/UIKit.h>
#import <UnityFramework/UnityFramework.h>

@interface UnityViewController : UIViewController

@property (nonatomic, strong) UIView *gameView;
@property (nonatomic, strong) UnityFramework *ufw;

- (void)handleTapEvent;

@end
