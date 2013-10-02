//
//  SharePlugin.h
//  BijouxAccessoiresDIY
//
//  Created by Jean-André Santoni on 02/10/13.
//  Copyright (c) 2013 Citronours media. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cordova/CDV.h"

@interface SharePlugin : CDVPlugin

- (void) triggerActionSheet:(CDVInvokedUrlCommand*)command;

@end
