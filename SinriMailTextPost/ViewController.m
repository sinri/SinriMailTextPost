//
//  ViewController.m
//  SinriMailTextPost
//
//  Created by Sinri Edogawa on 2019/7/3.
//  Copyright © 2019 Sinri Edogawa. All rights reserved.
//

#import "ViewController.h"
#import "smtp/SMTPMessage.h"
#import "smtp/SMTPAttachment.h"
#import "settings/LocalSettings.h"
#import "MyUIToolkit.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    
    //[self testSendMail];
    
    [_accountCB reloadData];
    if([[LocalSettings getSmtpConfigNameList]count]>0){
        [_accountCB selectItemAtIndex:0];
    }
    
}
    
    -(void)viewWillAppear{
        NSLog(@"viewWillAppear");
    }

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}
- (IBAction)resetMail:(id)sender {
    [_subjectTF setStringValue:@""];
    [_receiversTF setStringValue:@""];
    [_contentTV setString:@""];
    [_sendNewsLabel setStringValue:@"Draft Cleaned."];
}
- (IBAction)refreshAccountList:(id)sender {
    [_accountCB reloadData];
}
- (IBAction)sendMail:(id)sender {
    NSString*key=[[LocalSettings getSmtpConfigNameList] objectAtIndex:[_accountCB indexOfSelectedItem]];
    if(key==nil){
        [MyUIToolkit showModelErrorAlertWithTitle:@"No such config" andContent:@"Select one correct"];
        return;
    }
    NSDictionary* smtpConfig= [LocalSettings getSmtpConfig:key];
    
    SMTPMessage *message = [[SMTPMessage alloc] init];
    message.from = smtpConfig[@"account"];
    message.to = _receiversTF.stringValue;
    message.host = smtpConfig[@"host"];
    message.port=smtpConfig[@"port"];
    message.account = smtpConfig[@"account"];
    message.pwd = smtpConfig[@"password"];
    
    message.subject = _subjectTF.stringValue;
    message.content = [_contentTV string];
    /*
    SMTPAttachment* attach = [[SMTPAttachment alloc] init];
    attach.name = @"main.m";
    attach.filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"main" ofType:@"m"];
    message.attachments = @[attach];
    */
    
    [_sendNewsLabel setStringValue:@"Sending..."];
    
    [message send:^(SMTPMessage * message, double now, double total) {
        NSLog(@"process callback : now=%lf / total=%lf",now,total);
        [self->_sendNewsLabel performSelectorOnMainThread:@selector(setStringValue:) withObject:[NSString stringWithFormat:@"Sending %@ (%lf/%lf)", message.response,now,total] waitUntilDone:NO];
    } success:^(SMTPMessage * message) {
        NSLog(@"response = %@", [[NSString alloc] initWithData:message.response encoding:NSUTF8StringEncoding]);
        [self->_sendNewsLabel performSelectorOnMainThread:@selector(setStringValue:) withObject:[NSString stringWithFormat:@"Done"] waitUntilDone:NO];
    } failure:^(SMTPMessage * message, NSError * error) {
        NSLog(@"error = %@", error);
        [self->_sendNewsLabel performSelectorOnMainThread:@selector(setStringValue:) withObject:[NSString stringWithFormat:@"Failed to send mail. %@", error.description] waitUntilDone:NO];
    }];
}
    
    /* Notifications */
//- (void)comboBoxWillPopUp:(NSNotification *)notification;
//- (void)comboBoxWillDismiss:(NSNotification *)notification;
- (void)comboBoxSelectionDidChange:(NSNotification *)notification{
    NSLog(@"comboBoxSelectionDidChange %@ %li",notification, (long)[_accountCB indexOfSelectedItem]);
}
//- (void)comboBoxSelectionIsChanging:(NSNotification *)notification;
    
    /* These two methods are required when not using bindings */
- (NSInteger)numberOfItemsInComboBox:(NSComboBox *)comboBox{
    return [[LocalSettings getSmtpConfigNameList]count];
}
- (nullable id)comboBox:(NSComboBox *)comboBox objectValueForItemAtIndex:(NSInteger)index{
    NSString*key=[[LocalSettings getSmtpConfigNameList] objectAtIndex:index];
    //if(key==nil)return nil;
    //return [LocalSettings getSmtpConfig:key];
    return key;
}

- (NSUInteger)comboBox:(NSComboBox *)comboBox indexOfItemWithStringValue:(NSString *)string{
    return [[LocalSettings getSmtpConfigNameList]indexOfObject:string];
}
- (nullable NSString *)comboBox:(NSComboBox *)comboBox completedString:(NSString *)string{
    NSArray*array=[LocalSettings getSmtpConfigNameList];
    for (NSString* key in array) {
        if([key hasPrefix:string])return key;
    }
    return nil;
}
    

@end
