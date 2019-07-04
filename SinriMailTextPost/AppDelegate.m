//
//  AppDelegate.m
//  SinriMailTextPost
//
//  Created by Sinri Edogawa on 2019/7/3.
//  Copyright © 2019 Sinri Edogawa. All rights reserved.
//

#import "AppDelegate.h"
#import "MyUIToolkit.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

    -(BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender{
        return true;
    }
- (IBAction)openAboutWindow:(id)sender {
    [MyUIToolkit showModelErrorAlertWithTitle:@"About Sinri Mail Tex Post v1.0" andContent:@"Long Live Sinri!"];
}
    
@end
