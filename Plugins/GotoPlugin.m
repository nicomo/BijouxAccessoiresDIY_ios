//
//  GotoPlugin.m
//  BijouxAccessoiresDIY
//
//  Created by Jean-André Santoni on 07/10/13.
//  Copyright (c) 2013 Citronours media. All rights reserved.
//

#import "GotoPlugin.h"
#import "RootViewController.h"

@implementation GotoPlugin

- (void) goto:(CDVInvokedUrlCommand *) command {
    NSInteger next = [[command.arguments objectAtIndex:0] integerValue];
    
    NSString* call = [NSString stringWithFormat:@"loadpage(%i, %i)", next, 0];
    
    [self.webView stringByEvaluatingJavaScriptFromString:call];
    
    RootViewController* rvc = self.viewController.view.superview.nextResponder;
    
    if (next > 0) rvc.chapternametop.text = [chapters objectAtIndex:next-1];
    if (next < [chapters count]-1) rvc.chapternamebottom.text = [chapters objectAtIndex:next+1];
    NSIndexPath *ip=[NSIndexPath indexPathForRow:next inSection:0];
    [rvc.masterViewController.tableView selectRowAtIndexPath:ip animated:YES scrollPosition:UITableViewScrollPositionNone];
    
    current = next;
}

@end
