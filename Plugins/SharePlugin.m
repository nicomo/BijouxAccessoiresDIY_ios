//
//  SharePlugin.m
//  BijouxAccessoiresDIY
//
//  Created by Jean-André Santoni on 02/10/13.
//  Copyright (c) 2013 Citronours media. All rights reserved.
//

#import "SharePlugin.h"

@implementation SharePlugin

- (void) triggerActionSheet:(CDVInvokedUrlCommand *) command {
    NSString* name = [command.arguments objectAtIndex:0];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"pdf" inDirectory:@"www/assets/pdf"];
    NSData *pdf = [NSData dataWithContentsOfFile:path];
    
    NSArray *activityItems = @[pdf];
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    
    [self.viewController presentViewController:activityController animated:YES completion:nil];
}

@end