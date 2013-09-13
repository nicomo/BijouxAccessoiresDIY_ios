//
//  PinterestPlugin.h
//
//  Created by Jean-André Santoni on 08/07/13.
//
//

#import <Foundation/Foundation.h>
#import "Cordova/CDV.h"

@interface PinterestPlugin : CDVPlugin {}

- (void) initPin:(CDVInvokedUrlCommand*)command;
- (void) canPin:(CDVInvokedUrlCommand*)command;
- (void) composePin:(CDVInvokedUrlCommand*)command;

@end
