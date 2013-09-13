//
//  PinterestPlugin.m
//
//  Created by Jean-André Santoni on 08/07/13.
//
//

#import "PinterestPlugin.h"
#import "Cordova/CDV.h"
#import "Pinterest/Pinterest.h"

@implementation PinterestPlugin {
	Pinterest* pinterest;
}

- (void) initPin:(CDVInvokedUrlCommand*) command {
    NSString* clientID = [[command.arguments objectAtIndex:0] retain];
    pinterest = [[Pinterest alloc] initWithClientId:clientID];
}

- (void) canPin:(CDVInvokedUrlCommand*) command {
    BOOL canpin = [pinterest canPinWithSDK];
    [super writeJavascript:[[CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:canpin] toSuccessCallbackString:command.callbackId]];
}

- (void) composePin:(CDVInvokedUrlCommand*) command {
    NSString*        imageURL = [command.arguments objectAtIndex:0];
    NSString*       sourceURL = [command.arguments objectAtIndex:1];
    NSString* descriptionText = [command.arguments objectAtIndex:2];

    [pinterest createPinWithImageURL:[NSURL URLWithString:imageURL]
                           sourceURL:[NSURL URLWithString:sourceURL]
                         description:descriptionText];
}

@end
