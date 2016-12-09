//
//  AppDelegate.m
//  VStackTest
//
//  Created by Phu Nguyen on 6/22/15.
//  Copyright (c) 2015 Phu Nguyen. All rights reserved.
//

#import "AppDelegate.h"
#import "VStackTestController.h"
#import <VStack/VStackManager.h>
#import <VStack/VStackUser.h>
#import "ThirdPartyImplement.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Set APP ID
//    [[VStackManager instance] setAppId:@"26870527d2ac628002dda81be54217cf"];
    // Set APP PUBLIC KEY
//    [[VStackManager instance] setPublicKey:@"MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAq9s407QkMiZkXF0juCGjti6iWUDzqEmP+Urs3+g2zOf+rbIAZVZItS5a4BZlv3Dux3Xnmhrz240OZMBO1cNc poEQNij1duZlpJY8BJiptlrj3C+K/PSp0ijllnckwvYYpApm3RxC8ITvpmY3IZTrRKloC/XoRe39p68ARtxXKKW5I/YYxFucY91b6AEOUNaqMFEdLzpO/Dgccaxoc+N1SMfZOKue7aH0ZQIksLN7OQGVoiuf9wR2iSz3+FA+mMzRIP+lDxI4JE42Vvn1sYmMCY1GkkWUSzdQsfgnAIvnbepM2E4/95yMdRPP/k2Qdq9ja/mwEMTfA0yPUZ7LiywoZwIDAQAB"];
    
//    [[VStackManager instance] setAppId:@"0de3cc7573a4549b0cdf4a1d492cb85e"];
//    
//    [[VStackManager instance] setPublicKey:@"MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAm+YvW1ETsfSlOwNlbM5v09/Jk9cVcOt0Q/JlWbcHOkl8wyTfzhrTzQtET8/bD/wN6jVdKDASI8VENn8ppHCg6YIv7EzmpWtWxUStkG0EacRZRDj/U3NduGu02Qx+TglHchBbDWiqY8uqLQb55FR0D+idm4JFvHc163Qpyle61QiBoImZc12GzbN7QAp1GXK3Rkm72Yni+7N2xDKXfEAJh/DhmEVL6KxXSFTIcH2374yrxRZfd+vLW974dvhUvWueXjoykn3vNqYQMQlDr5E5tXPgcRMhXFF4k+xg3GJew9Kk9lYmnrr9971o5S5ZLKjhA3BoZ/bq6hBDZ/zE+z0mKwIDAQAB"];
    
    [[VStackManager instance] setAppId:@"8f6b6d607b7b6f5ec45b367c1c97ca68"];
    
    [[VStackManager instance] setPublicKey:@"MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApxDkgYRgUr24soveQzHXE9GqQLi8Kv0KJtd35glW8UHry6Vy7o2fCGMNDTewKLrQmFLvAoMavIT+ZWKGG0yaARJQ93GduKmQ1C9UAgc3hLlHfW/YabwgENCkUdKtrnLZdx603wxxCfrmehP7LsqEp8BaHQJeTy4FLdCofTqNb8sR836Vk5CWoc11RoYsFJqV6htmxTgpxaHG3jJZOj15ran2rDSN7/yQc+nl8YIEeqmppYWupAe1/N3MkXwmTUPqgQUkXwPbYbuvHtLKLtOaHqSjQ88Vppjg0igZO6gTjL0vY8eumtePb61Ylv8JXzZ6Y+CXoE6x8/15rjG8jCMFvwIDAQAB"];
    
    // SET VSTACK DELEGATE
    [VStackManager instance].vsUserInfoDelegate = [ThirdPartyImplement instance];
    [VStackManager instance].vsChatDelegate = [ThirdPartyImplement instance];
    [VStackManager instance].vsCallDelegate = [ThirdPartyImplement instance];
    
    // INITIAL
    [[VStackManager instance] setTintColorNavigationBar:[UIColor blackColor]];
    [[VStackManager instance] setLanguage:@"en"];
    [[VStackManager instance] setDebugLog:YES];
    [[VStackManager instance] initial];
//    [[VStackManager instance] setServerType:1];
    
    VStackTestController * vStackTestController = [[VStackTestController alloc] init];
    vStackTestController.title = @"Authenticating ...";
    
    // CONNECT
    
    [[VStackManager instance] connectWithVStackUserId:@"vstack" userCredentials:@"vstack_credentials" fullname:@"VStack" completion:^(NSString *authenticatedVStackUserID, NSError *error, BOOL successful) {
        if (successful) {
            NSLog(@"Authent successful, authenticatedVStackUserID: %@", authenticatedVStackUserID);
            dispatch_async(dispatch_get_main_queue(), ^{
                vStackTestController.title = [NSString stringWithFormat:@"Your vStackUserID: %@", authenticatedVStackUserID];
            });
        } else {
            NSLog(@"Authent failed. ResponseCode: %ld. Error Message: %@", (long)error.code, [error description]);
        }

    }];
    
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(-200, -200) forBarMetrics:UIBarMetricsDefault];
    }
    
    UINavigationController* navController = [[UINavigationController alloc] initWithRootViewController:vStackTestController];
    navController.navigationBar.translucent = NO;
    
    self.window.rootViewController = navController;
    self.window.rootViewController.view.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
