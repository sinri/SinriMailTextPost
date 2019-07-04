//
//  ViewController.h
//  SinriMailTextPost
//
//  Created by Sinri Edogawa on 2019/7/3.
//  Copyright © 2019 Sinri Edogawa. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController
<NSComboBoxDelegate,NSComboBoxDataSource>

    @property NSString* smtpConfigKey;
    @property (weak) IBOutlet NSTextField *subjectTF;
    @property (weak) IBOutlet NSTextField *receiversTF;
    @property (unsafe_unretained) IBOutlet NSTextView *contentTV;
    @property (weak) IBOutlet NSTextField *sendNewsLabel;
    @property (weak) IBOutlet NSComboBox *accountCB;
    
@end

