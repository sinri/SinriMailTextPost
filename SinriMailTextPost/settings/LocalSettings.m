//
//  LocalSettings.m
//  SinriMailTextPost
//
//  Created by Sinri Edogawa on 2019/7/3.
//  Copyright © 2019 Sinri Edogawa. All rights reserved.
//

#import "LocalSettings.h"


@implementation LocalSettings
    
    +(void)setSmtpConfig:(NSString*)smtpConfigName
                    host:(NSString*)host
                    port:(NSString*)port
                 account:(NSString*)account
                password:(NSString*)password
    {
        NSDictionary*currentDictionary=[[NSUserDefaults standardUserDefaults] dictionaryForKey:@"smtp_config_list"];
        if(currentDictionary==nil)currentDictionary=@{};
        NSMutableDictionary* mutableDictionary=[currentDictionary mutableCopy];
        [mutableDictionary setObject:@{
                                       @"host":host,
                                       @"port":port,
                                       @"account":account,
                                       @"password":password
                                       } forKey:smtpConfigName];
        [[NSUserDefaults standardUserDefaults] setObject:mutableDictionary forKey:@"smtp_config_list"];
    }
    
    +(NSDictionary*)getSmtpConfig:(NSString*)smtpConfigName{
        NSDictionary*currentDictionary=[[NSUserDefaults standardUserDefaults] dictionaryForKey:@"smtp_config_list"];
        if(currentDictionary==nil)return nil;
        return [currentDictionary objectForKey:smtpConfigName];
    }
    
    +(NSArray*)getSmtpConfigNameList{
        NSDictionary*currentDictionary=[[NSUserDefaults standardUserDefaults] dictionaryForKey:@"smtp_config_list"];
        return [currentDictionary allKeys];
    }
    
    @end
