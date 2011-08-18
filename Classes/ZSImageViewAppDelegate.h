//
//  ZSImageViewAppDelegate.h
//  ZSImageView
//
//  Created by Nicholas Hubbard on 8/16/11.
//  Copyright 2011 Zed Said Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZSImageViewViewController;

@interface ZSImageViewAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ZSImageViewViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ZSImageViewViewController *viewController;

@end

