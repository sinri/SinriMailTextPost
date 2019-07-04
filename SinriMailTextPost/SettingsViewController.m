//
//  SettingsViewController.m
//  SinriMailTextPost
//
//  Created by Sinri Edogawa on 2019/7/3.
//  Copyright © 2019 Sinri Edogawa. All rights reserved.
//

#import "SettingsViewController.h"
#import "settings/LocalSettings.h"
#import "MyUIToolkit.h"

@interface SettingsViewController ()
    
    @end

@implementation SettingsViewController
    
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    [self loadExistedSmtpConfigList];
    [_existedSmtpConfigSelectButton selectItem:nil];
}
    
    -(void)loadExistedSmtpConfigList{
        [_existedSmtpConfigSelectButton removeAllItems];
        NSArray*list=[LocalSettings getSmtpConfigNameList];
        if(list==nil)list=@[];
        [_existedSmtpConfigSelectButton addItemsWithTitles:list];
    }
- (IBAction)existedSmtpConfigAction:(id)sender {
    NSLog(@"existedSmtpConfigAction selection might be changed to  %@",[_existedSmtpConfigSelectButton titleOfSelectedItem]);
    NSString*selectedSmtpConfigName=[_existedSmtpConfigSelectButton titleOfSelectedItem];
    if(selectedSmtpConfigName==nil){
        [MyUIToolkit showModelErrorAlertWithTitle:@"This config does not exist!"
                                       andContent:@"You should select an existed config to edit, or you might create a new one."
         ];
        return;
    }
    if([selectedSmtpConfigName isEqualToString:_eConfigNameTF.stringValue]){
        return;
    }
    
    // refresh
    NSDictionary*existed=[LocalSettings getSmtpConfig:selectedSmtpConfigName];
    
    [_eConfigNameTF setStringValue:selectedSmtpConfigName];
    [_eHostTF setStringValue:existed[@"host"]];
    [_ePortTF setStringValue:existed[@"port"]];
    [_eAccountTF setStringValue:existed[@"account"]];
    [_ePasswordSTF setStringValue:existed[@"password"]];
}
- (IBAction)saveExistedSmtpConfig:(id)sender {
    // TODO
    NSString*selectedSmtpConfigName=[_eConfigNameTF stringValue];
    NSDictionary*dict=[LocalSettings getSmtpConfig:selectedSmtpConfigName];
    //NSLog(@"saveExistedSmtpConfig %@ -> %@",selectedSmtpConfigName,dict);
    if(dict==nil){
        [MyUIToolkit showModelErrorAlertWithTitle:@"This config does not exist!"
                                       andContent:@"You should select an existed config to edit, or you might create a new one."
         ];
    }
    
    [_eNewsLabel setStringValue:@"Saving..."];
    
    [LocalSettings setSmtpConfig:_eConfigNameTF.stringValue
                            host:_eHostTF.stringValue
                            port:_ePortTF.stringValue
                         account:_eAccountTF.stringValue
                        password:_ePasswordSTF.stringValue
     ];
    
    [_eNewsLabel setStringValue:[NSString stringWithFormat:@"Saved %@",_eConfigNameTF.stringValue]];
}
- (IBAction)saveNewSmtpConfig:(id)sender {
    //NSLog(@"saveNewSmtpConfig [%@] %@:%@ %@ %@",_cConfigNameTF.stringValue,_cHostTF.stringValue,_cPortTF.stringValue,_cAccountTF.stringValue,_cPasswordSTF.stringValue);
    
    [_cNewsLabel setStringValue:@"Saving..."];
    
    [LocalSettings setSmtpConfig:_cConfigNameTF.stringValue
                            host:_cHostTF.stringValue
                            port:_cPortTF.stringValue
                         account:_cAccountTF.stringValue
                        password:_cPasswordSTF.stringValue
     ];
    
    [_cNewsLabel setStringValue:[NSString stringWithFormat:@"Saved %@",_cConfigNameTF.stringValue]];
    
    [_cConfigNameTF setStringValue:@""];
    [_cHostTF setStringValue:@""];
    [_cPortTF setStringValue:@""];
    [_cAccountTF setStringValue:@""];
    [_cPasswordSTF setStringValue:@""];
    
}
    
    @end
