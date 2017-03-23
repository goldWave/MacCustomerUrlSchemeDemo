//
//  AppDelegate.m
//  MacCustomerUrlSchemeDemo
//
//  Created by jimbo on 2017/3/23.
//  Copyright © 2017年 naver. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationWillFinishLaunching:(NSNotification *)notification {
    [[NSAppleEventManager sharedAppleEventManager] setEventHandler:self andSelector:@selector(handleURLEvent:withReplyEvent:) forEventClass:kInternetEventClass andEventID:kAEGetURL];
}

- (void)handleURLEvent:(NSAppleEventDescriptor*)event
        withReplyEvent:(NSAppleEventDescriptor*)replyEvent{
    NSString *url = [[event paramDescriptorForKeyword:keyDirectObject]  stringValue];
    NSAlert *alert = [[NSAlert alloc] init];
    alert.messageText = @"唤醒的url";
    alert.informativeText = url;
    [alert addButtonWithTitle:@"ok"];
    [alert setAlertStyle:NSAlertStyleWarning];
    
    NSModalResponse returnCode =  [alert runModal];
    NSLog(@"----%zi",returnCode);
}

@end
