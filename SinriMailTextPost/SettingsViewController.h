//
//  SettingsViewController.h
//  SinriMailTextPost
//
//  Created by Sinri Edogawa on 2019/7/3.
//  Copyright © 2019 Sinri Edogawa. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface SettingsViewController : NSViewController

    @property (weak) IBOutlet NSPopUpButton *existedSmtpConfigSelectButton;
    @property (weak) IBOutlet NSTextField *eConfigNameTF;
    @property (weak) IBOutlet NSTextField *eHostTF;
    @property (weak) IBOutlet NSTextField *ePortTF;
    @property (weak) IBOutlet NSTextField *eAccountTF;
    @property (weak) IBOutlet NSSecureTextField *ePasswordSTF;
    @property (weak) IBOutlet NSTextField *eNewsLabel;
    
    
    
    @property (weak) IBOutlet NSTextField *cHostTF;
    @property (weak) IBOutlet NSTextField *cPortTF;
    @property (weak) IBOutlet NSTextField *cAccountTF;
    @property (weak) IBOutlet NSSecureTextField *cPasswordSTF;
    @property (weak) IBOutlet NSTextField *cConfigNameTF;
    @property (weak) IBOutlet NSTextField *cNewsLabel;
    
    
@end

NS_ASSUME_NONNULL_END
