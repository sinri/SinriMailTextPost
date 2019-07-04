//
//  MyUIToolkit.m
//  SinriMailTextPost
//
//  Created by Sinri Edogawa on 2019/7/3.
//  Copyright © 2019 Sinri Edogawa. All rights reserved.
//

#import "MyUIToolkit.h"

@implementation MyUIToolkit
    +(NSModalResponse)showModelErrorAlertWithTitle:(NSString*)title andContent:(NSString*)content{
        NSAlert * alert=[[NSAlert alloc]init];
        [alert setAlertStyle:(NSAlertStyleCritical)];
        [alert setInformativeText:content];
        [alert setMessageText:title];
        return [alert runModal];
    }

@end
