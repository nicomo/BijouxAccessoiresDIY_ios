//
//  GotoPlugin.h
//  BijouxAccessoiresDIY
//
//  Created by Jean-André Santoni on 07/10/13.
//  Copyright (c) 2013 Citronours media. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cordova/CDV.h"

@interface GotoPlugin : CDVPlugin

- (void) goto:(CDVInvokedUrlCommand*)command;

@end
