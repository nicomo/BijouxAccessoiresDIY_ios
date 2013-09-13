//
//  AppDelegate.m
//
//  Created by Jean-André Santoni on 17/07/13.
//  Copyright (c) 2013 Jean-André Santoni. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"
NSArray* chapters;
NSArray* colors;
int current;

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [_rootViewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    chapters = [NSArray arrayWithObjects:
                @"Couture Géométrique",
                @"Introduction",
                @"Conseils Techniques",
                @"Le top à manches kimono",
                @"La cape cache-cœur",
                @"La robe « Y »",
                @"La jupe modulable à plis",
                @"Le chauffe-épaules",
                @"Le tablier girly",
                @"La ceinture obi origami",
                @"Le bandeau vintage",
                @"La broche pétales",
                @"Une pochette pour tablette",
                @"Et maintenant ?",
                nil];
    
    colors = [NSArray arrayWithObjects:
              [UIColor clearColor],
              [UIColor colorWithRed:.80 green:.00 blue:.47 alpha:1],
              [UIColor colorWithRed:.00 green:.61 blue:.59 alpha:1],
              [UIColor colorWithRed:.42 green:.39 blue:.25 alpha:1],
              [UIColor colorWithRed:.83 green:.73 blue:.08 alpha:1],
              [UIColor colorWithRed:.97 green:.11 blue:.37 alpha:1],
              [UIColor colorWithRed:.44 green:.46 blue:.49 alpha:1],
              [UIColor colorWithRed:.56 green:.79 blue:.93 alpha:1],
              [UIColor colorWithRed:.21 green:.23 blue:.23 alpha:1],
              [UIColor colorWithRed:.32 green:.51 blue:.62 alpha:1],
              [UIColor colorWithRed:.94 green:.66 blue:.67 alpha:1],
              [UIColor colorWithRed:.73 green:.72 blue:.37 alpha:1],
              [UIColor colorWithRed:.93 green:.47 blue:.40 alpha:1],
              [UIColor colorWithRed:.93 green:.77 blue:.12 alpha:1],
              [UIColor colorWithRed:.09 green:.72 blue:.65 alpha:1],
              nil];
    
    current = 0;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
