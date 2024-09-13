//
//  UnityViewManager.m
//  UnityController
//
//  Created by Michael A Edgcumbe on 9/12/24.
//
#import "UnityViewManager.h"
#import "UnityViewController.h"

@implementation UnityViewManager

RCT_EXPORT_MODULE(UnityView)

- (UIView *)view
{
    UnityViewController *unityVC = [[UnityViewController alloc] init];
    return unityVC.view;
}

@end
